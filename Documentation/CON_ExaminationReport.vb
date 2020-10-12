Private Sub Document_New()

End Sub

Private Sub Document_Open()
'

' Setup the data source and run the merge

'

Set MainDocument = ActiveDocument

With ActiveDocument.MailMerge

.MainDocumentType = wdFormLetters
#If Win64 Then
.OpenDataSource _
Name:="", _
connection:="DSN=EMu Conservation x64;", _
SQLStatement:="SELECT * FROM Objects.csv", _
SubType:=wdMergeSubTypeWord2000
#Else
.OpenDataSource _
Name:="", _
connection:="DSN=EMu Conservation;", _
SQLStatement:="SELECT * FROM Objects.csv", _
SubType:=wdMergeSubTypeWord2000
#End If
.Destination = wdSendToNewDocument

.Execute Pause:=False

End With



   Dim key As String
   Dim row As Integer
   Dim table As Word.table
   Dim connection As New ADODB.connection
   Dim recordset As New ADODB.recordset
   '
   ' Connect to the DSN that we are going to use
   connection.Open "DSN=EMu Conservation;"
   '
   ' This code cycles through each table we have added to the Word document in order to populate
   ' it with data. 
   For i = 1 To ActiveDocument.Tables.Count
       With ActiveDocument.Tables(i)
           '
           ' Insert Multimedia
            If .Columns.Count = 1 Then
               key = .Cell(1, 1).Range.Text
               key = Trim(Left(key, Len(key) - 2))
               .Cell(1, 1).Range.Text = ""
                recordset.Open "select * from Media.csv where Objects_key = " & key, connection
                apath = recordset("Multimedia")
                .Cell(1, 1).Range.InlineShapes.AddPicture FileName:=apath, _
                LinkToFile:=False, SaveWithDocument:=True
                recordset.Close
            End If
           '
           ' Copy and then modify the following "If" section of code (between the If and
           ' End If statements) for each .csv file generated.
           If InStr(.Cell(1, 1).Range.Text, "Creators:") = 1 Then
               '
               ' Identify the key - in this case it is located in row 1, column 2
               key = .Cell(1, 2).Range.Text
               key = Trim(Left(key, Len(key) - 2))
               '
               ' We want to display the CreRole, CreCreatorAfterFollower, and NamFullName for each related Creator1.
               ' Because the number of attached Creator1 records is unknown, we use the
               ' following code to add a row dynamically for each record.
               row = 1
               '
               ' You would replace the name of the .csv file and key as required
               ' by your report.
               ' In this example the .csv file is called Creator1.csv
               ' and the key is Objects_key
               recordset.Open "select * from Creator1.csv where Objects_key = " & key, connection
               While Not recordset.EOF
                   row = row + 1
                   .Rows.Add
                   .Cell(row, 1).Range.Text = recordset("CreRole") & ":"
                   .Cell(row, 2).Range.Text = Trim(recordset("CreCreatorAfterFollower") & " " & recordset("NamFullName"))
                   recordset.MoveNext
               Wend
               recordset.Close
               '
               ' Remove the row containing the key so that it doesn't display
               ' in the mail merge report
               .Rows(1).Select
               Selection.Rows.Delete
   
            ' Remove the table borders
            .Borders.Enable = False
   
           End If
           '
           ' Copy and then modify the following "If" section of code (between the If and
           ' End If statements) for each .csv file generated.
           If InStr(.Cell(1, 1).Range.Text, "CON#:") = 1 Then
               '
               ' Identify the key - in this case it is located in row 1, column 2
               key = .Cell(1, 2).Range.Text
               key = Trim(Left(key, Len(key) - 2))
               '
               ' We want to display the CON#.
               ' We use the following code to add a row dynamically for each record.
               row = 1
               '
               ' You would replace the name of the .csv file and key as required
               ' by your report.
               ' In this example the .csv file is called econserv.csv
               ' and the key is econservation_key
               recordset.Open "select * from econserv.csv where econservation_key = " & key, connection
               While Not recordset.EOF
                   row = row + 1
                   .Rows.Add
                   .Cell(row, 1).Range.Text = "CON#:"
                   .Cell(row, 2).Range.Text = recordset("ReqConservationIdentifier")
                   recordset.MoveNext
               Wend
               recordset.Close
               '
               ' Remove the row containing the key so that it doesn't display
               ' in the mail merge report
               .Rows(1).Select
               Selection.Rows.Delete
   
            ' Remove the table borders
            .Borders.Enable = False
   
           End If
           '
           ' Copy and then modify the following "If" section of code (between the If and
           ' End If statements) for each .csv file generated.
           If InStr(.Cell(1, 1).Range.Text, "Conservators:") = 1 Then
               '
               ' Identify the key - in this case it is located in row 1, column 2
               key = .Cell(1, 2).Range.Text
               key = Trim(Left(key, Len(key) - 2))
               '
               ' We want to display the names of all associated conservators.
               ' Because the number of attached Conservs records is unknown, we use the
               ' following code to add a row dynamically for each record.
               row = 1
               '
               ' You would replace the name of the .csv file and key as required
               ' by your report.
               ' In this example the .csv file is called Conservs.csv
               ' and the key is econservation_key
               recordset.Open "select * from Conservs.csv where econservation_key = " & key, connection
               While Not recordset.EOF
                   row = row + 1
                   .Rows.Add
                   .Cell(row, 2).Range.Text = Replace(recordset("SummaryData"), "IMA - ", "")
                   recordset.MoveNext
               Wend
               recordset.Close
               '
               ' Remove the row containing the key so that it doesn't display
               ' in the mail merge report
               .Rows(1).Select
               Selection.Rows.Delete
               '
               ' Add "Conservators:"
               .Cell(1, 1).Range.Text = "Conservators:"
   
            ' Remove the table borders
            .Borders.Enable = False
   
           End If
           '
           ' Copy and then modify the following "If" section of code (between the If and
           ' End If statements) for each .csv file generated.
           If InStr(.Cell(1, 1).Range.Text, "Completion Date:") = 1 Then
               '
               ' Identify the key - in this case it is located in row 1, column 2
               key = .Cell(1, 2).Range.Text
               key = Trim(Left(key, Len(key) - 2))
               '
               ' We want to display the completion date.
               ' We use the following code to add a row dynamically for each record.
               row = 1
               '
               ' You would replace the name of the .csv file and key as required
               ' by your report.
               ' In this example the .csv file is called econserv.csv
               ' and the key is econservation_key
               recordset.Open "select * from econserv.csv where econservation_key = " & key, connection
               While Not recordset.EOF
                   row = row + 1
                   .Rows.Add
                   .Cell(row, 1).Range.Text = "Completion Date:"
                   .Cell(row, 2).Range.Text = recordset("ReqActualCompletionDate")
                   recordset.MoveNext
               Wend
               recordset.Close
               '
               ' Remove the row containing the key so that it doesn't display
               ' in the mail merge report
               .Rows(1).Select
               Selection.Rows.Delete
   
            ' Remove the table borders
            .Borders.Enable = False
   
           End If
       End With
   Next i
   '
   ' Close down our connections
   connection.Close


'

' Force all fields to be updated in case we have images

'

ActiveDocument.Fields.Update

' MainDocument.Close SaveChanges:=False
End Sub

Private Sub Document_Close()
' When the document is closed we need to disconnect the

' data source otherwise Word will try and use it

' when opening the document

ActiveDocument.MailMerge.MainDocumentType = wdNotAMergeDocument

ActiveDocument.Save
End Sub


