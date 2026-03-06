/*
    https://leetcode.com/problems/dna-pattern-recognition/
*/

SELECT
    sample_id,
    dna_sequence,
    species,
    (
        CASE 
            WHEN dna_sequence LIKE 'ATG%' THEN 1 ELSE 0 
        END
    ) as has_start,
    (
        CASE 
            WHEN dna_sequence LIKE '%TAA' THEN 1
            WHEN dna_sequence LIKE '%TAG' THEN 1
            WHEN dna_sequence LIKE '%TGA' THEN 1 
            ELSE 0 
        END
    ) as has_stop,
    (
        CASE 
            WHEN dna_sequence LIKE '%ATAT%' THEN 1 ELSE 0 
        END
    ) as has_atat,
    (
        CASE 
            WHEN dna_sequence LIKE '%GGG%' THEN 1 ELSE 0 
        END
    ) as has_ggg    
FROM
    Samples