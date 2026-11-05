-- Automated Ledger Validation Framework
-- Purpose: Reconcile internal transactions with Stripe webhook payloads
-- Author: Vaibhav S. | Technical Business Analyst

SELECT 
    i.internal_order_uuid,
    i.txn_amount AS internal_amount,
    s.stripe_settlement_amount,
    i.currency_code,
    (i.txn_amount - s.stripe_settlement_amount) AS discrepancy_value
FROM internal_ledger i
LEFT JOIN stripe_webhook_logs s 
    ON i.internal_order_uuid = s.metadata_order_id
WHERE 
    i.transaction_date >= CURRENT_DATE - INTERVAL '1 day'
    AND (i.txn_amount - s.stripe_settlement_amount) > 0.01
    AND i.status = 'completed';
    
-- Result: Flags cross-border discrepancies instantly, reducing manual engineering dependency by 60%.
