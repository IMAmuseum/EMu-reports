USE CollectionsTest
GO

CREATE TABLE [objects] (
  [object_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [emu_irn] int NOT NULL,
  [dagwood_id] int,
  [publish] bit NOT NULL,
  [status] nvarchar(255),
  [accession_number] nvarchar(255),
  [previous_id] nvarchar(255),
  [date_accessioned_year] int,
  [date_accessioned_month] int,
  [date_accessioned_day] int,
  [title] nvarchar(max),
  [series_title] nvarchar(max),
  [portfolio_title] nvarchar(max),
  [date_created] nvarchar(255),
  [date_created_earliest] int,
  [date_created_latest] int,
  [date_designed] nvarchar(255),
  [date_designed_earliest] int,
  [date_designed_latest] int,
  [period] nvarchar(255),
  [dynasty] nvarchar(255),
  [record_type] nvarchar(255) NOT NULL,
  [medium_support] nvarchar(255),
  [technique] nvarchar(255),
  [style] nvarchar(255),
  [mark_description] nvarchar(max),
  [dimensions] nvarchar(max),
  [credit_line] nvarchar(max),
  [rights_acknowledgement] nvarchar(max),
  [provenance] varchar(max),
  [department] int,
  [on_view] bit NOT NULL,
  [location_id] int,
  [parent_irn] int,
  [deaccession_method] nvarchar(255),
  [deaccession_date_year] int,
  [deaccession_date_month] int,
  [deaccession_date_day] int,
  [recipient] int,
  [transfer_notes] varchar(max),
  [sale_price] decimal(18,4),
  [date_modified] date NOT NULL
)
GO

CREATE TABLE [flags] (
  [flag_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [flag] nvarchar(255) UNIQUE
)
GO

CREATE TABLE [object_flags] (
  [object_id] int NOT NULL,
  [flag_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [alt_titles] (
  [object_id] int NOT NULL,
  [alt_title] nvarchar(max),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_creators] (
  [object_id] int NOT NULL,
  [party_id] int NOT NULL,
  [attribution] nvarchar(255),
  [role] nvarchar(255),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_cultures] (
  [object_id] int NOT NULL,
  [attribution] nvarchar(255),
  [culture] nvarchar(255),
  [nationality] nvarchar(255),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_places] (
  [object_id] int NOT NULL,
  [country] nvarchar(255),
  [state] nvarchar(255),
  [district] nvarchar(255),
  [city] nvarchar(255),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [mediums] (
  [medium_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [medium] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [object_mediums] (
  [object_id] int NOT NULL,
  [medium_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [supports] (
  [support_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [support] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [object_supports] (
  [object_id] int NOT NULL,
  [support_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [types] (
  [type_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [type] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [object_types] (
  [object_id] int NOT NULL,
  [type_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [mark_types] (
  [mark_type_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [mark_type] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [object_marks] (
  [object_id] int NOT NULL,
  [mark_type_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_printers] (
  [object_id] int NOT NULL,
  [party_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_publishers] (
  [object_id] int NOT NULL,
  [party_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [object_dimensions] (
  [object_id] int NOT NULL,
  [type] nvarchar(255),
  [height] decimal(18,4),
  [width] decimal(18,4),
  [depth] decimal(18,4),
  [diameter] decimal(18,4),
  [length_unit] nvarchar(255),
  [weight] decimal(18,4),
  [weight_unit] nvarchar(255),
  [notes] nvarchar(max),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [rights_uris] (
  [rights_uri_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [type] nvarchar(255) NOT NULL,
  [uri] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [object_rights_uris] (
  [object_id] int NOT NULL,
  [rights_uri_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [departments] (
  [department_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [department] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [locations] (
  [location_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [emu_irn] int NOT NULL,
  [publish] bit NOT NULL,
  [code] nvarchar(255),
  [level_1] nvarchar(255),
  [level_2] nvarchar(255),
  [level_3] nvarchar(255),
  [level_4] nvarchar(255),
  [level_5] nvarchar(255),
  [level_6] nvarchar(255),
  [level_7] nvarchar(255),
  [level_8] nvarchar(255),
  [date_modified] date NOT NULL
)
GO

CREATE TABLE [related_objects] (
  [object_id_1] int NOT NULL,
  [object_id_2] int NOT NULL,
  [relationship] nvarchar(255),
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id_1], [sort_order])
)
GO

CREATE TABLE [object_guids] (
  [object_id] int NOT NULL,
  [preferred] bit NOT NULL,
  [type] nvarchar(255) NOT NULL,
  [guid] nvarchar(255) NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([object_id], [sort_order])
)
GO

CREATE TABLE [narratives] (
  [narrative_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [emu_irn] int NOT NULL,
  [publish] bit NOT NULL,
  [title] nvarchar(255),
  [purpose] nvarchar(255),
  [date_year] int,
  [date_month] int,
  [date_day] int,
  [narrative] varchar(max) NOT NULL,
  [date_modified] date NOT NULL
)
GO

CREATE TABLE [narrative_authors] (
  [narrative_id] int NOT NULL,
  [party_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([narrative_id], [sort_order])
)
GO

CREATE TABLE [narrative_objects] (
  [narrative_id] int NOT NULL,
  [object_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([narrative_id], [sort_order])
)
GO

CREATE TABLE [narrative_events] (
  [narrative_id] int NOT NULL,
  [event_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([narrative_id], [sort_order])
)
GO

CREATE TABLE [narrative_parties] (
  [narrative_id] int NOT NULL,
  [party_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([narrative_id], [sort_order])
)
GO

CREATE TABLE [parties] (
  [party_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [emu_irn] int NOT NULL,
  [publish] bit NOT NULL,
  [party_type] nvarchar(255),
  [full_name] nvarchar(max),
  [title] nvarchar(255),
  [first_name] nvarchar(255),
  [middle_name] nvarchar(255),
  [last_name] nvarchar(255),
  [suffix] nvarchar(255),
  [gender] nvarchar(255),
  [nationality] nvarchar(255),
  [birth_date] nvarchar(255),
  [birth_place] nvarchar(255),
  [death_date] nvarchar(255),
  [death_place] nvarchar(255),
  [organization_name] nvarchar(max),
  [commencement_date] nvarchar(255),
  [completion_date] nvarchar(255),
  [collaboration_name] nvarchar(max),
  [acronym] nvarchar(255),
  [date_modified] date NOT NULL
)
GO

CREATE TABLE [party_other_names] (
  [party_id] int NOT NULL,
  [other_name] nvarchar(max) NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([party_id], [sort_order])
)
GO

CREATE TABLE [party_identities] (
  [party_id] int NOT NULL,
  [identity] nvarchar(255) NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([party_id], [sort_order])
)
GO

CREATE TABLE [collaborators] (
  [party_id] int NOT NULL,
  [collaborator_id] int NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([party_id], [sort_order])
)
GO

CREATE TABLE [roles] (
  [role_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [role] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [party_roles] (
  [party_id] int NOT NULL,
  [role_id] int,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([party_id], [sort_order])
)
GO

CREATE TABLE [party_guids] (
  [party_id] int NOT NULL,
  [preferred] bit NOT NULL,
  [type] nvarchar(255) NOT NULL,
  [guid] nvarchar(255) NOT NULL,
  [sort_order] int NOT NULL,
  PRIMARY KEY ([party_id], [sort_order])
)
GO

CREATE TABLE [events] (
  [event_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [emu_irn] int NOT NULL
)
GO

ALTER TABLE [objects] ADD FOREIGN KEY ([department]) REFERENCES [departments] ([department_id])
GO

ALTER TABLE [objects] ADD FOREIGN KEY ([location_id]) REFERENCES [locations] ([location_id])
GO

ALTER TABLE [objects] ADD FOREIGN KEY ([parent_irn]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_flags] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_flags] ADD FOREIGN KEY ([flag_id]) REFERENCES [flags] ([flag_id])
GO

ALTER TABLE [alt_titles] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_creators] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_creators] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [object_cultures] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_places] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_mediums] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_mediums] ADD FOREIGN KEY ([medium_id]) REFERENCES [mediums] ([medium_id])
GO

ALTER TABLE [object_supports] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_supports] ADD FOREIGN KEY ([support_id]) REFERENCES [supports] ([support_id])
GO

ALTER TABLE [object_types] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_types] ADD FOREIGN KEY ([type_id]) REFERENCES [types] ([type_id])
GO

ALTER TABLE [object_marks] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_marks] ADD FOREIGN KEY ([mark_type_id]) REFERENCES [mark_types] ([mark_type_id])
GO

ALTER TABLE [object_printers] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_printers] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [object_publishers] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_publishers] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [object_dimensions] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_rights_uris] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_rights_uris] ADD FOREIGN KEY ([rights_uri_id]) REFERENCES [rights_uris] ([rights_uri_id])
GO

ALTER TABLE [related_objects] ADD FOREIGN KEY ([object_id_1]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [related_objects] ADD FOREIGN KEY ([object_id_2]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [object_guids] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [narrative_authors] ADD FOREIGN KEY ([narrative_id]) REFERENCES [narratives] ([narrative_id])
GO

ALTER TABLE [narrative_authors] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [narrative_objects] ADD FOREIGN KEY ([narrative_id]) REFERENCES [narratives] ([narrative_id])
GO

ALTER TABLE [narrative_objects] ADD FOREIGN KEY ([object_id]) REFERENCES [objects] ([object_id])
GO

ALTER TABLE [narrative_events] ADD FOREIGN KEY ([narrative_id]) REFERENCES [narratives] ([narrative_id])
GO

ALTER TABLE [narrative_events] ADD FOREIGN KEY ([event_id]) REFERENCES [events] ([event_id])
GO

ALTER TABLE [narrative_parties] ADD FOREIGN KEY ([narrative_id]) REFERENCES [narratives] ([narrative_id])
GO

ALTER TABLE [narrative_parties] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [party_other_names] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [party_identities] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [collaborators] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [collaborators] ADD FOREIGN KEY ([collaborator_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [party_roles] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO

ALTER TABLE [party_roles] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([role_id])
GO

ALTER TABLE [party_guids] ADD FOREIGN KEY ([party_id]) REFERENCES [parties] ([party_id])
GO
