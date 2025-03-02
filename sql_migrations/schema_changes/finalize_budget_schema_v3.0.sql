-- ==============================================
-- DATA MIGRATION: PMO BACKUP TO PMO TABLE
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-21  
-- Purpose: Migrates transactional data from `pmo_backup` to `pmo` table,  
-- ensuring normalization and alignment with the updated schema. This completes Project 2A: Database Normalization.  
-- ==============================================

BEGIN;

INSERT INTO pmo (payment_no, transaction_date, campaign_id, description,
                 contract_no, purchase_order, purchase_requisition,
                 project_no, payment_entity, amount_usd, amount_cny)
SELECT pb.payment_no, pb.transaction_date, cm.campaign_id, 
       CASE
           WHEN cm.campaign_id = '1000' THEN 'Ops Optimization Wave transaction'
           WHEN cm.campaign_id = '1025' THEN 'Compliance Shield transaction'
           WHEN cm.campaign_id = '1035' THEN 'Brand Integrity Initiative transaction'
           WHEN cm.campaign_id = '1045' THEN 'Adherence Accelerator transaction'
           WHEN cm.campaign_id = '1055' THEN 'Risk and Compliance Sync transaction'
           WHEN cm.campaign_id = '2000' THEN 'Market Expansion Sprint transaction'
           WHEN cm.campaign_id = '3000' THEN 'Enterprise Growth Plan transaction'
           WHEN cm.campaign_id = '3500' THEN 'Trust and Safety Reinforce transaction'
           WHEN cm.campaign_id = '4000' THEN 'Operational Resilience transaction'
           WHEN cm.campaign_id = '4500' THEN 'Safety Signals Outreach transaction'
           WHEN cm.campaign_id = '5000' THEN 'PMO Efficiency Drive transaction'
           WHEN cm.campaign_id = '5225' THEN 'PMO Governance Upgrade transaction'
           WHEN cm.campaign_id = '5275' THEN 'Data Security Framework transaction'
           WHEN cm.campaign_id = '5500' THEN 'Consumer Trust Blueprint transaction'
           WHEN cm.campaign_id = '7720' THEN 'Global Marketing Pulse transaction'
           WHEN cm.campaign_id = '7730' THEN 'Campaign Strategy 360 transaction'
           WHEN cm.campaign_id = '7740' THEN 'Marketing Intelligence Hub transaction'
           WHEN cm.campaign_id = '7750' THEN 'Creative Media Push transaction'
           WHEN cm.campaign_id = '7760' THEN 'Performance Marketing Surge transaction'
           ELSE pb.description
       END AS description,
       pb.contract_no, pb.purchase_order, pb.purchase_requisition, 
       pb.project_no, pb.payment_entity, pb.amount_usd, pb.amount_cny
FROM pmo_backup pb
LEFT JOIN campaign_mapping cm ON pb.project_no = cm.project_no;

COMMIT;
