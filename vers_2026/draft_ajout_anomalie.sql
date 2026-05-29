-- Object:    stareau_ass.ass_anomalie
-- Type:      TABLE
-- Database:  stareau_next
-- Generated: 2026-05-29T09:38:00.779Z
-- Lines:     54

CREATE TABLE "stareau_ass"."ass_anomalie" (
    "id_ass_anomalie" text DEFAULT gen_random_uuid() NOT NULL,
    "type_anomalie" text NOT NULL,
    "origine_anomalie" text NOT NULL,
    "description_anomalie" text,
    "date_debut_anomalie" timestamp without time zone NOT NULL,
    "date_cloture_anomalie" timestamp without time zone,
    "cause_cloture" text,
    "ref_patrimoine" text,
    "patrimoine_origine_distance" text,
    "distance_origine" real,
    "ref_intervention" text,
    "geom" geometry(Point,2154) NOT NULL
);

-- Column Comments
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."id_ass_anomalie" IS 'identifiant métier';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."type_anomalie" IS 'type d''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."origine_anomalie" IS 'origine casue de l''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."description_anomalie" IS 'description détaillée';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."date_debut_anomalie" IS 'date de début ou constat de l''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."date_cloture_anomalie" IS 'date de fin ou de cloture de l''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."cause_cloture" IS 'cause de fin d''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."ref_patrimoine" IS 'patrimoine impacté par l''anomalie';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."patrimoine_origine_distance" IS 'patrimoine référence pour la distance';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."distance_origine" IS 'distance par rapport au patrimoine référence';
COMMENT ON COLUMN "stareau_ass"."ass_anomalie"."ref_intervention" IS 'identifiant intervention';



CREATE TABLE "stareau_aep"."aep_anomalie" (
    "id_aep_anomalie" text DEFAULT gen_random_uuid() NOT NULL,
    "type_anomalie" text NOT NULL,
    "origine_anomalie" text NOT NULL,
    "description_anomalie" text,
    "date_debut_anomalie" timestamp without time zone NOT NULL,
    "date_cloture_anomalie" timestamp without time zone,
    "cause_cloture" text,
    "ref_patrimoine" text,
    "patrimoine_origine_distance" text,
    "distance_origine" real,
    "ref_intervention" text,
    "geom" geometry(Point,2154) NOT NULL
);

-- Column Comments
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."id_aep_anomalie" IS 'identifiant métier';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."type_anomalie" IS 'type d''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."origine_anomalie" IS 'origine casue de l''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."description_anomalie" IS 'description détaillée';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."date_debut_anomalie" IS 'date de début ou constat de l''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."date_cloture_anomalie" IS 'date de fin ou de cloture de l''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."cause_cloture" IS 'cause de fin d''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."ref_patrimoine" IS 'patrimoine impacté par l''anomalie';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."patrimoine_origine_distance" IS 'patrimoine référence pour la distance';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."distance_origine" IS 'distance par rapport au patrimoine référence';
COMMENT ON COLUMN "stareau_aep"."aep_anomalie"."ref_intervention" IS 'identifiant intervention';