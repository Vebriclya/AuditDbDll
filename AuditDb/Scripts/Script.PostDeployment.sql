﻿IF NOT EXISTS (select * from dbo.Templates)
BEGIN
    INSERT INTO dbo.Templates(TemplateName, IsArchived)
    VALUES ('Dummy Template', 0)
    INSERT INTO dbo.Sections(TemplateId, Title, OrderInAudit, HasQuestions, IsArchived)
    VALUES (1, 'General First Impression - External', 1, 1, 0),
           (1, 'Building Maintenance - External', 2, 1, 0),
           (1, 'First Impressions and Maintenance - Internal', 3, 1, 0),
           (1, 'Health and Safety Requirements', 4, 1, 0),
           (1, 'Home in the Community', 5, 1, 0),
           (1, 'Summary of First Impressions', 6, 0, 0),
           (1, 'Summary of Repairs and Maintenance Issues', 7, 0, 0)
    INSERT INTO dbo.Questions(SectionId, QuestionText, QuestionInfo, OrderInSection, HasSelectBoxes, IsArchived)
    VALUES (1, 'Front Garden', 'e.g; planting, free of rubbish, tidy?',1, 1, 0),
           (1, 'Back/Side Garden', '', 2, 1, 0),
           (1, 'Bin storage', 'e.g; out of the way, no overspill', 3, 1, 0),
           (1, 'Font Entrance', 'e.g; clean, tidy, welcoming?', 4, 1, 0),
           (1, 'Rear/Side Entrance', '', 5, 1, 0),
           (1, 'Smoking area', 'e.g; ashtrays empty, free of cigarette butts?', 6, 1, 0),
           (2, 'Roof, Gutters and Drains - Front', '', 1, 1, 0),
           (2, 'Roof, Gutters and Drains - Rear/Side', '', 2, 1, 0),
           (2, 'Windows - Front', '', 3, 1, 0),
           (2, 'Windows - Rear/Side', '', 4, 1, 0),
           (2, 'Paintwork - Front', '', 5, 1, 0),
           (2, 'Paintwork - Rear/Side', '', 6, 1, 0),
           (2, 'Brickwork/Render - Front', '', 7, 1, 0),
           (2, 'Brickwork/Render - Rear/Side', '', 8, 1, 0),
           (2, 'Boundary Walls/Fencing - Front', '', 9, 1, 0),
           (2, 'Boundary Walls/Fencing - Side', '', 10, 1, 0),
           (2, 'Boundary Walls/Fencing - Rear', '', 11, 1, 0),
           (2, 'Garden Maintenance - Front', '', 12, 1, 0),
           (2, 'Garden Maintenance - Rear/Side', '', 13, 1, 0),
           (2, 'Outbuildings', '', 14, 1, 0),
           (2, 'SU Feedback', '', 15, 0, 0),
           (2, 'Staff Feedback', '', 16, 0, 0),
           (2, 'Off Road Parking', 'First impression/Access Maintenance issues?', 17, 1, 0),
           (3, 'Hallway - First Impressions', 'Clean, tidy, welcoming?', 1, 1, 0),
           (3, 'Maintenance/Repairs - Hallway', '', 2, 0, 0),
           (3, 'Shared Communal Space - First Impressions', '', 3, 1, 0),
           (3, 'Shared Communal Space - Furnishings', '', 4, 1, 0),
           (3, 'Shared Communal Space - Maintenance/Repairs', '', 5, 0, 0),
           (3, 'Kitchen - First Impressions', '', 6, 1, 0),
           (3, 'Kitchen - Cleanliness of White Goods etc', 'Ovens, extractor fans, fridge etc', 7, 1, 0),
           (3, 'Kitchen - Utilities', '', 8, 1, 0),
           (3, 'Kitchen - Maintenance/Repairs', '', 9, 0, 0),
           (3, 'Communal Bathrooms - First Impressions', '', 10, 1, 0),
           (3, 'Communal Bathrooms - Cleanliness', 'Toilet, shower, extractor fans etc', 11, 1, 0),
           (3, 'Communal Bathrooms - Maintenance/Repairs', '', 12, 0, 0),
           (3, 'Office - First Impressions', '', 13, 1, 0),
           (3, 'Office - Cleanliness', 'Including H&S', 14, 1, 0),
           (3, 'Office - Maintenance/Repairs', '', 15, 0, 0),
           (3, 'Other - First Impressions', 'e.g; Staff sleep-in', 16, 1, 0),
           (3, 'Other - Cleanliness', 'Including H&S', 17, 1, 0),
           (3, 'Other - Maintenance/Repairs', '', 18, 0, 0),
           (3, 'SU Feedback', '', 19, 0, 0),
           (3, 'Staff Feedback', '', 20, 0, 0),
           (4, 'CCTV Cameras Working?', '', 1, 1, 0),
           (4, 'Front/Rear/Side Door Locks/Window Locks', '', 2, 1, 0),
           (4, 'Security Lighting', '', 3, 1, 0),
           (4, 'Fire Doors', '', 4, 1, 0),
           (4, 'Fire Safety Checks', '', 5, 1, 0),
           (4, 'Gas/Electricity Compliance', '', 6, 1, 0),
           (4, 'Water Checks', '', 7, 1, 0),
           (5, 'Location', 'Near amenities, transport, supporting social inclusion?', 1, 1, 0)
           
END 