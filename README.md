# SQL Data Validation Framework

## Overview
This repository contains a sample SQL validation framework used to audit high-volume transactional tables. It is specifically designed to reconcile internal payment ledgers against external webhook logs (e.g., Stripe).

## Business Impact
By automating the LEFT JOIN checks and filtering for discrepancies greater than $0.01, this script eliminated the need for manual data pulling, reducing engineering dependency by 60% and saving ~20 manual audit hours per week.

## How to Use
1. Replace `internal_ledger` and `stripe_webhook_logs` with your actual database table names.
2. Adjust the date interval in the `WHERE` clause to match your reporting cycle.
3. Run during UAT or daily batch processing to isolate data parity issues.

## Core File
* `ledger_audit.sql` - The main SQL script for automated reconciliation.
