-- ==============================================
-- INSERT REFERENCE DATA: MARKETS TABLE
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-18
-- Purpose: Inserts reference data into the agencies table.
-- ==============================================

BEGIN;

INSERT INTO public.agencies (agency_name, agency_legal_entity)
VALUES
('42West', '42West LLC'),
('AdFactors PR', 'Adfactors Public Relations Pvt. Ltd.'),
('APCO Worldwide', 'APCO Worldwide LLC'),
('BAM Communications', 'BAM Communications Inc.'),
('BerlinRosen', 'BerlinRosen Ltd.'),
('BlueFocus Communications', 'BlueFocus Intelligent Communications Group Co., Ltd.'),
('Brunswick Group', 'Brunswick Group LLP'),
('Burson Cohn & Wolfe (BCW)', 'WPP plc'),
('Clarity PR', 'Clarity Global Communications Ltd.'),
('Cutline', 'Cutline Communications LLC'),
('Edelman', 'Edelman Holdings LLC'),
('Finsbury Glover Hering (FGH)', 'Finsbury Glover Hering LLC'),
('FleishmanHillard', 'Omnicom Group Inc.'),
('Hathaway PR', 'Hathaway Public Relations Ltd.'),
('Highwire Agency', 'Highwire PR Inc.'),
('IMA Agency', 'IMA International B.V.'),
('INK Communications', 'INK Communications Co.'),
('Ketchum', 'Omnicom Group Inc.'),
('Manifest PR', 'Manifest Group Ltd.'),
('Obviously', 'Obviously Inc.'),
('PRecious Communications', 'PRecious Communications Pte. Ltd.'),
('Purpose PR', 'Purpose Public Relations LLC'),
('Sard Verbinnen & Co. (SVC)', 'Finsbury Glover Hering (FGH)'),
('SPRG', 'Strategic Public Relations Group Ltd.'),
('The Lede Company', 'The Lede Company LLC'),
('Weber Shandwick', 'Interpublic Group (IPG)')
    
ON CONFLICT (agency_name) DO NOTHING;

COMMIT;
