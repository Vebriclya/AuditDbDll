CREATE PROCEDURE spAudits_Begin
    @TemplateID INT,
    @AuditDate DATE
AS
BEGIN
    -- Start a transaction
    BEGIN TRANSACTION;

    -- Step 1: Create a new audit
    DECLARE @NewAuditID INT;
    INSERT INTO AUDITS (template_id, audit_date)
    VALUES (@TemplateID, @AuditDate);

    -- Get the ID of the newly created audit
    SET @NewAuditID = SCOPE_IDENTITY();

    -- Step 2: Copy sections from the template to the audit
    DECLARE @SectionID INT;
    DECLARE @NewAuditSectionID INT;

    DECLARE SectionCursor CURSOR FOR
    SELECT id, name, description
    FROM SECTIONS
    WHERE template_id = @TemplateID;

    OPEN SectionCursor;

    FETCH NEXT FROM SectionCursor INTO @SectionID, @SectionName, @SectionDescription;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Insert the section into AuditSections
        INSERT INTO AUDITSECTIONS (audit_id, template_section_id, name, description)
        VALUES (@NewAuditID, @SectionID, @SectionName, @SectionDescription);

        -- Get the ID of the newly created audit section
        SET @NewAuditSectionID = SCOPE_IDENTITY();

        -- Step 3: Copy questions from the section to the audit section
        DECLARE @QuestionID INT;
        DECLARE @QuestionText TEXT;

        DECLARE QuestionCursor CURSOR FOR
        SELECT id, question_text
        FROM QUESTIONS
        WHERE section_id = @SectionID;

        OPEN QuestionCursor;

        FETCH NEXT FROM QuestionCursor INTO @QuestionID, @QuestionText;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Insert the question into AuditQuestions
            INSERT INTO AUDITQUESTIONS (audit_section_id, template_question_id, question_text)
            VALUES (@NewAuditSectionID, @QuestionID, @QuestionText);

            FETCH NEXT FROM QuestionCursor INTO @QuestionID, @QuestionText;
        END

        CLOSE QuestionCursor;
        DEALLOCATE QuestionCursor;

        FETCH NEXT FROM SectionCursor INTO @SectionID, @SectionName, @SectionDescription;
    END

    CLOSE SectionCursor;
    DEALLOCATE SectionCursor;

    -- Commit the transaction
    COMMIT TRANSACTION;
END;
`
