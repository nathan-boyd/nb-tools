;;; Compiled snippets and support files for `sql-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sql-mode
                     '(("upsert-sproc" "SET ANSI_NULLS ON;\nSET QUOTED_IDENTIFIER ON;\n\nIF NOT EXISTS (\n    SELECT * FROM sys.objects\n    WHERE object_id = OBJECT_ID('dbo.$0$1')\n    AND type='P'\n)\nBEGIN\n    EXEC (N'CREATE PROCEDURE dbo.$1 AS RETURN 0;');\nEND;\n\nALTER PROCEDURE [dbo].$1\n    @MemberID BIGINT\n    ,@EnterpriseID BIGINT\n    ,@ApplicationID UNIQUEIDENTIFIER\n    ,@IsActive BIT\nAS\n    SET NOCOUNT ON;\n    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;\n\n    IF EXISTS(\n            SELECT *\n            FROM $2\n            WHERE [MemberID] = @MemberID)\n        BEGIN\n            UPDATE [dbo].[$2]\n            SET [ModifiedDateUTC] = GETUTCDATE()\n            WHERE \n        END;\n    ELSE\n        BEGIN\n            INSERT INTO [dbo].[$2]\n                ([$3]\n                ,[$4]\n                ,[$5]\n                ,[$6])\n            VALUES\n                (@$3\n                ,@$4\n                ,@$5\n                ,@$6)\n            GO\n        END;\n\n    IF @@ROWCOUNT = 0\n        BEGIN\n            RETURN -1;\n        END\n    ELSE\n        BEGIN\n            RETURN 1;\n        END\n\n/*####################################################################\n$$ Author:      Nathan Boyd\n$$ Purpose:     \n$$ Modified     \n######################################################################*/\n" "upsert-sproc" nil nil nil "c:/Users/nboyd/AppData/Roaming/.emacs.d/snippets/sql-mode/upsert-sproc" nil nil)))


;;; Do not edit! File generated at Mon Jul 18 15:52:39 2016
