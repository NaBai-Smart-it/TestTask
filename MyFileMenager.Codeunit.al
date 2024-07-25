
//As i was trying creating my file menager i find out that some of metods nedet to upload imeges are scope on perm 
//so i give up on this idea bud not delete code just in case)))
// codeunit 50403 MyFileMenager
// {
//     var        
//         XMLFileType: Label 'XML Files (*.xml)|*.xml', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         WordFileType: Label 'Word Files (*.doc)|*.doc', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         Word2007FileType: Label 'Word Files (*.docx;*.doc)|*.docx;*.doc', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         ExcelFileType: Label 'Excel Files (*.xls)|*.xls', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         Excel2007FileType: Label 'Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         XSDFileType: Label 'XSD Files (*.xsd)|*.xsd', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         HTMFileType: Label 'HTM Files (*.htm)|*.htm', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         XSLTFileType: Label 'XSLT Files (*.xslt)|*.xslt', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         TXTFileType: Label 'Text Files (*.txt)|*.txt', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         RDLFileTypeTok: Label 'SQL Report Builder (*.rdl;*.rdlc)|*.rdl;*.rdlc', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         UnsupportedFileExtErr: Label 'Unsupported file extension (.%1). The supported file extensions are (%2).';
//         AllFilesDescriptionTxt: Label 'All Files (*.*)|*.*', Comment = '{Split=r''\|''}{Locked=s''1''}';
//         AllFilesFilterTxt: Label '*.*', Locked = true;
//         SingleFilterErr: Label 'Specify a file filter and an extension filter when using this function.';

//     procedure UploadFile(WindowTitle: Text[50]; ClientFileName: Text) ServerFileName: Text
//     var
//         "Filter": Text;
//         FileName: Text;
//     begin
//         Filter := GetToFilterText('', ClientFileName);

//         FileName := ClientFileName.Substring(0, ClientFileName.IndexOf('.'));
//         if (FileName = '') then
//             ClientFileName := '';

//         ServerFileName := UploadFileWithFilter(WindowTitle, ClientFileName, Filter, AllFilesFilterTxt);
//     end;

//     procedure GetToFilterText(FilterString: Text; FileName: Text): Text
//     var
//         OutExt: Text;
//     begin
//         if FilterString <> '' then
//             exit(FilterString);

//         case UpperCase(GetExtension(FileName)) of
//             'DOC':
//                 OutExt := WordFileType;
//             'DOCX':
//                 OutExt := Word2007FileType;
//             'XLS':
//                 OutExt := ExcelFileType;
//             'XLSX':
//                 OutExt := Excel2007FileType;
//             'XSLT':
//                 OutExt := XSLTFileType;
//             'XML':
//                 OutExt := XMLFileType;
//             'XSD':
//                 OutExt := XSDFileType;
//             'HTM':
//                 OutExt := HTMFileType;
//             'TXT':
//                 OutExt := TXTFileType;
//             'RDL':
//                 OutExt := RDLFileTypeTok;
//             'RDLC':
//                 OutExt := RDLFileTypeTok;
//         end;

//         OnAfterGetToFilterTextSetOutExt(FileName, OutExt);

//         if OutExt = '' then
//             exit(AllFilesDescriptionTxt);
//         exit(OutExt + '|' + AllFilesDescriptionTxt);  // Also give the option of the general selection
//     end;

//     procedure GetExtension(Name: Text): Text
//     var
//         FileExtension: Text;
//     begin
//         Name := Name.Substring(Name.IndexOf('.'));
//         FileExtension := Name;

//         if FileExtension <> '' then
//             FileExtension := DelChr(FileExtension, '<', '.');

//         exit(FileExtension);
//     end;

//     procedure UploadFileWithFilter(WindowTitle: Text[50]; ClientFileName: Text; FileFilter: Text; ExtFilter: Text) ServerFileName: Text
//     var
//         Uploaded: Boolean;
//         IsHandled: Boolean;
//     begin
//         IsHandled := false;
//         OnBeforeUploadFileWithFilter(ServerFileName, WindowTitle, ClientFileName, FileFilter, ExtFilter, IsHandled);
//         if IsHandled then
//             exit;

//         ClearLastError();

//         if (FileFilter = '') xor (ExtFilter = '') then
//             Error(SingleFilterErr);

//         Uploaded := Upload(WindowTitle, '', FileFilter, ClientFileName, ServerFileName);
//         if Uploaded then
//             ValidateFileExtension(ClientFileName, ExtFilter);
//         if Uploaded then
//             exit(ServerFileName);

//         if GetLastErrorText <> '' then
//             Error('%1', GetLastErrorText);

//         exit('');
//     end;

//     procedure ValidateFileExtension(FilePath: Text; ValidExtensions: Text)
//     var
//         FileExt: Text;
//         LowerValidExts: Text;
//         FileName : Text;
//     begin
//         if StrPos(ValidExtensions, AllFilesFilterTxt) <> 0 then
//             exit;
        
//         FileName := FilePath.Substring(0, FilePath.IndexOf('.'));
//         FileExt := LowerCase(GetExtension(FileName));
//         LowerValidExts := LowerCase(ValidExtensions);

//         if StrPos(LowerValidExts, FileExt) = 0 then
//             Error(UnsupportedFileExtErr, FileExt, LowerValidExts);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterGetToFilterTextSetOutExt(FileName: Text; var OutExt: Text)
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnBeforeUploadFileWithFilter(var ServerFileName: Text; WindowTitle: Text[50]; ClientFileName: Text; FileFilter: Text; ExtFilter: Text; var IsHandled: Boolean)
//     begin
//     end;

    
// }