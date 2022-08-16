CREATE TABLE "objects" (
  "object_id" SERIAL PRIMARY KEY NOT NULL,
  "emu_irn" int UNIQUE NOT NULL,
  "dagwood_id" int,
  "publish" boolean NOT NULL,
  "status" varchar,
  "accession_number" varchar,
  "previous_id" varchar,
  "date_accessioned_year" int,
  "date_accessioned_month" int,
  "date_accessioned_day" int,
  "title" varchar,
  "series_title" varchar,
  "portfolio_title" varchar,
  "date_created" varchar,
  "date_created_earliest" int,
  "date_created_latest" int,
  "date_designed" varchar,
  "date_designed_earliest" int,
  "date_designed_latest" int,
  "period" varchar,
  "dynasty" varchar,
  "record_type" varchar NOT NULL,
  "medium_support" varchar,
  "technique" varchar,
  "style" varchar,
  "mark_description" varchar,
  "dimensions" varchar,
  "credit_line" varchar,
  "rights_acknowledgement" varchar,
  "provenance" varchar,
  "department_id" int,
  "on_view" boolean NOT NULL,
  "location_id" int,
  "parent_id" int,
  "deaccession_method" varchar,
  "deaccession_date_year" int,
  "deaccession_date_month" int,
  "deaccession_date_day" int,
  "recipient_id" int,
  "transfer_notes" varchar,
  "sale_price" decimal(18,4),
  "date_modified" date NOT NULL
);

CREATE TABLE "flags" (
  "flag_id" SERIAL PRIMARY KEY NOT NULL,
  "flag" varchar UNIQUE
);

CREATE TABLE "object_flags" (
  "object_id" int NOT NULL,
  "flag_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "alt_titles" (
  "object_id" int NOT NULL,
  "alt_title" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_creators" (
  "object_id" int NOT NULL,
  "party_id" int NOT NULL,
  "attribution" varchar,
  "role" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_cultures" (
  "object_id" int NOT NULL,
  "attribution" varchar,
  "culture" varchar,
  "nationality" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_places" (
  "object_id" int NOT NULL,
  "country" varchar,
  "state" varchar,
  "district" varchar,
  "city" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "mediums" (
  "medium_id" SERIAL PRIMARY KEY NOT NULL,
  "medium" varchar UNIQUE NOT NULL
);

CREATE TABLE "object_mediums" (
  "object_id" int NOT NULL,
  "medium_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "supports" (
  "support_id" SERIAL PRIMARY KEY NOT NULL,
  "support" varchar UNIQUE NOT NULL
);

CREATE TABLE "object_supports" (
  "object_id" int NOT NULL,
  "support_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "types" (
  "type_id" SERIAL PRIMARY KEY NOT NULL,
  "type" varchar UNIQUE NOT NULL
);

CREATE TABLE "object_types" (
  "object_id" int NOT NULL,
  "type_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "mark_types" (
  "mark_type_id" SERIAL PRIMARY KEY NOT NULL,
  "mark_type" varchar UNIQUE NOT NULL
);

CREATE TABLE "object_marks" (
  "object_id" int NOT NULL,
  "mark_type_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_printers" (
  "object_id" int NOT NULL,
  "party_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_publishers" (
  "object_id" int NOT NULL,
  "party_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "object_dimensions" (
  "object_id" int NOT NULL,
  "type" varchar,
  "height" decimal(18,4),
  "width" decimal(18,4),
  "depth" decimal(18,4),
  "diameter" decimal(18,4),
  "length_unit" varchar,
  "weight" decimal(18,4),
  "weight_unit" varchar,
  "notes" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "rights_uris" (
  "rights_uri_id" SERIAL PRIMARY KEY NOT NULL,
  "type" varchar NOT NULL,
  "uri" varchar UNIQUE NOT NULL
);

CREATE TABLE "object_rights_uris" (
  "object_id" int NOT NULL,
  "rights_uri_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "departments" (
  "department_id" SERIAL PRIMARY KEY NOT NULL,
  "department" varchar UNIQUE NOT NULL
);

CREATE TABLE "locations" (
  "location_id" SERIAL PRIMARY KEY NOT NULL,
  "emu_irn" int UNIQUE NOT NULL,
  "publish" boolean NOT NULL,
  "code" varchar,
  "level_1" varchar,
  "level_2" varchar,
  "level_3" varchar,
  "level_4" varchar,
  "level_5" varchar,
  "level_6" varchar,
  "level_7" varchar,
  "level_8" varchar,
  "date_modified" date NOT NULL
);

CREATE TABLE "related_objects" (
  "object_id_1" int NOT NULL,
  "object_id_2" int NOT NULL,
  "relationship" varchar,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id_1", "sort_order")
);

CREATE TABLE "object_guids" (
  "object_id" int NOT NULL,
  "preferred" boolean NOT NULL,
  "type" varchar NOT NULL,
  "guid" varchar NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("object_id", "sort_order")
);

CREATE TABLE "narratives" (
  "narrative_id" SERIAL PRIMARY KEY NOT NULL,
  "emu_irn" int UNIQUE NOT NULL,
  "publish" boolean NOT NULL,
  "title" varchar,
  "purpose" varchar,
  "date_year" int,
  "date_month" int,
  "date_day" int,
  "narrative" varchar NOT NULL,
  "date_modified" date NOT NULL
);

CREATE TABLE "narrative_authors" (
  "narrative_id" int NOT NULL,
  "party_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("narrative_id", "sort_order")
);

CREATE TABLE "narrative_objects" (
  "narrative_id" int NOT NULL,
  "object_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("narrative_id", "sort_order")
);

CREATE TABLE "narrative_events" (
  "narrative_id" int NOT NULL,
  "event_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("narrative_id", "sort_order")
);

CREATE TABLE "narrative_parties" (
  "narrative_id" int NOT NULL,
  "party_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("narrative_id", "sort_order")
);

CREATE TABLE "parties" (
  "party_id" SERIAL PRIMARY KEY NOT NULL,
  "emu_irn" int UNIQUE NOT NULL,
  "publish" boolean NOT NULL,
  "party_type" varchar,
  "full_name" varchar,
  "title" varchar,
  "first_name" varchar,
  "middle_name" varchar,
  "last_name" varchar,
  "suffix" varchar,
  "gender" varchar,
  "nationality" varchar,
  "birth_date" varchar,
  "birth_place" varchar,
  "death_date" varchar,
  "death_place" varchar,
  "organization_name" varchar,
  "commencement_date" varchar,
  "completion_date" varchar,
  "collaboration_name" varchar,
  "acronym" varchar,
  "date_modified" date NOT NULL
);

CREATE TABLE "party_other_names" (
  "party_id" int NOT NULL,
  "other_name" varchar NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("party_id", "sort_order")
);

CREATE TABLE "party_identities" (
  "party_id" int NOT NULL,
  "identity" varchar NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("party_id", "sort_order")
);

CREATE TABLE "collaborators" (
  "party_id" int NOT NULL,
  "collaborator_id" int NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("party_id", "sort_order")
);

CREATE TABLE "roles" (
  "role_id" SERIAL PRIMARY KEY NOT NULL,
  "role" varchar UNIQUE NOT NULL
);

CREATE TABLE "party_roles" (
  "party_id" int NOT NULL,
  "role_id" int,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("party_id", "sort_order")
);

CREATE TABLE "party_guids" (
  "party_id" int NOT NULL,
  "preferred" boolean NOT NULL,
  "type" varchar NOT NULL,
  "guid" varchar NOT NULL,
  "sort_order" int NOT NULL,
  PRIMARY KEY ("party_id", "sort_order")
);

CREATE TABLE "events" (
  "event_id" SERIAL PRIMARY KEY NOT NULL,
  "emu_irn" int NOT NULL
);

ALTER TABLE "objects" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("department_id");

ALTER TABLE "objects" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "objects" ADD FOREIGN KEY ("parent_id") REFERENCES "objects" ("object_id");

ALTER TABLE "objects" ADD FOREIGN KEY ("recipient_id") REFERENCES "parties" ("party_id");

ALTER TABLE "object_flags" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_flags" ADD FOREIGN KEY ("flag_id") REFERENCES "flags" ("flag_id");

ALTER TABLE "alt_titles" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_creators" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_creators" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "object_cultures" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_places" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_mediums" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_mediums" ADD FOREIGN KEY ("medium_id") REFERENCES "mediums" ("medium_id");

ALTER TABLE "object_supports" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_supports" ADD FOREIGN KEY ("support_id") REFERENCES "supports" ("support_id");

ALTER TABLE "object_types" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_types" ADD FOREIGN KEY ("type_id") REFERENCES "types" ("type_id");

ALTER TABLE "object_marks" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_marks" ADD FOREIGN KEY ("mark_type_id") REFERENCES "mark_types" ("mark_type_id");

ALTER TABLE "object_printers" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_printers" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "object_publishers" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_publishers" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "object_dimensions" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_rights_uris" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "object_rights_uris" ADD FOREIGN KEY ("rights_uri_id") REFERENCES "rights_uris" ("rights_uri_id");

ALTER TABLE "related_objects" ADD FOREIGN KEY ("object_id_1") REFERENCES "objects" ("object_id");

ALTER TABLE "related_objects" ADD FOREIGN KEY ("object_id_2") REFERENCES "objects" ("object_id");

ALTER TABLE "object_guids" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "narrative_authors" ADD FOREIGN KEY ("narrative_id") REFERENCES "narratives" ("narrative_id");

ALTER TABLE "narrative_authors" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "narrative_objects" ADD FOREIGN KEY ("narrative_id") REFERENCES "narratives" ("narrative_id");

ALTER TABLE "narrative_objects" ADD FOREIGN KEY ("object_id") REFERENCES "objects" ("object_id");

ALTER TABLE "narrative_events" ADD FOREIGN KEY ("narrative_id") REFERENCES "narratives" ("narrative_id");

ALTER TABLE "narrative_events" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("event_id");

ALTER TABLE "narrative_parties" ADD FOREIGN KEY ("narrative_id") REFERENCES "narratives" ("narrative_id");

ALTER TABLE "narrative_parties" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "party_other_names" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "party_identities" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "collaborators" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "collaborators" ADD FOREIGN KEY ("collaborator_id") REFERENCES "parties" ("party_id");

ALTER TABLE "party_roles" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");

ALTER TABLE "party_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "party_guids" ADD FOREIGN KEY ("party_id") REFERENCES "parties" ("party_id");
