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
connection:="DSN=EMu Catalogue x64;", _
SQLStatement:="SELECT * FROM ecatalog.csv", _
SubType:=wdMergeSubTypeWord2000
#Else
.OpenDataSource _
Name:="", _
connection:="DSN=EMu Catalogue;", _
SQLStatement:="SELECT * FROM ecatalog.csv", _
SubType:=wdMergeSubTypeWord2000
#End If
.Destination = wdSendToNewDocument

.Execute Pause:=False

End With
Dim key As String
Dim row As Integer
Dim table As Word.table
Dim objects As String
Dim connection As New ADODB.connection
Dim recordset As New ADODB.recordset

'

' Connect to the DSN that we are going to use


#If Win64 Then
connection.Open "EMu Catalogue x64"
#Else
connection.Open "EMu Catalogue"
#End If


'
' This code cycles through each table we have added to the Word document in order to populate
' it with data. In this example we have only one table.

For i = 1 To ActiveDocument.Tables.Count
    With ActiveDocument.Tables(i)
    '
    ' Copy and then modify the following "if" section of code (between the If and
    ' End If statement foreach .csv file generated.
         If InStr(.Cell(1, 1).Range.Text, "Creator") = 1 Then
    '
    'Identify the key - in this case it is located in row 1, column 2
    
    key = .Cell(1, 2).Range.Text
    key = Trim(Left(key, Len(key) - 2))
  
        ' We want to display the IRN and SummaryData.
        ' Because the number of attached Catalogue records is unknown, we use the
        ' following code to add a row dynamically for each record.
        row = 1
        '
        ' Your would replace this name of the .csv file and key as required
        ' by your report.
        ' In this example the .csv file is called ObjObjec.csv
        ' and they key is eloans_key.
        
        recordset.Open "select * from CreCreat.csv where ecatalogue_key = " & key, connection

        '

        ' This code populates the table in our mail merge report with data

        ' (from the Summary Data field in our second .csv file in this example)

        ' one row for each record

        While Not recordset.EOF
            
            '.Cell(row, 1).Range.Text = recordset("ecatalogue_key")
            '.Cell(row, 1).Range.Text = recordset("ecatalogue_key")
            .Cell(row, 3).Range.Text = recordset("SummaryData")
            row = row + 1
            .Rows.Add
            recordset.MoveNext
            Wend
            recordset.Close
                

        '

        ' Remove the column containing the eloans_key from our mail merge table

        ' so that it doesn't display in the mail merge report

        .Columns(2).Select

        Selection.Columns.Delete

        
    End If
    ' Add multimedia to the report
    ' Update image table
    If .Columns.Count = 1 Then

               key = .Cell(1, 1).Range.Text

               key = Trim(Left(key, Len(key) - 2))

               .Cell(1, 1).Range.Text = ""
                recordset.Open "select * from MulMulti.csv where ecatalogue_key = " & key, connection
                row = 1

                While Not recordset.EOF
                    row = row + 1
                    .Rows.Add

                    apath = recordset("Multimedia")
                    .Cell(row, 1).Range.InlineShapes.AddPicture FileName:=apath, _
                        LinkToFile:=False, SaveWithDocument:=True

                    recordset.MoveNext
                Wend
                recordset.Close

            End If
                    '

        'This removes borders from the table

'        table.Borders.Enable = False
    End With


Next i

'

' Close down our connections

  connection.Close
'

' Force all fields to be updated in case we have images

'

ActiveDocument.Fields.Update

'MainDocument.Close SaveChanges:=False
End Sub

Private Sub Document_Close()
' When the document is closed we need to disconnect the

' data source otherwise Word will try and use it

' when opening the document

ActiveDocument.MailMerge.MainDocumentType = wdNotAMergeDocument

ActiveDocument.Save
End Sub
