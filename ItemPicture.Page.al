
page 50407 ItemPictureFactBox
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = LunchItem;
    
    layout
    {
        area(content)
        {
            field(Picture; Rec.Picture)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the picture that has been inserted for the item.';
            }
        }
    }

    
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                Visible = HideActions = false;

                trigger OnAction()
                begin
                    ImportFromDevice();
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';
                Visible = HideActions = false;

                trigger OnAction()
                begin
                    DeleteItemPicture();
                end;
            }
        }
    }

    procedure ImportFromDevice()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
    begin
        Rec.Find();
        Rec.TestField("No.");
        if Rec.Description = '' then
            Error(MustSpecifyDescriptionErr);

        if Rec.Picture.Count > 0 then
            if not Confirm(OverrideImageQst) then
                Error('');

        ClientFileName := '';
        FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
        if FileName = '' then
            Error('');

        Clear(Rec.Picture);
        Rec.Picture.ImportFile(FileName, ClientFileName);
        Rec.Modify(true);
        
        if FileManagement.DeleteServerFile(FileName) then;
    end;

    procedure DeleteItemPicture()
        begin
            Rec.TestField("No.");

            if not Confirm(DeleteImageQst) then
                exit;

            Clear(Rec.Picture);
            Rec.Modify(true);

        end;
    
    var
        HideActions: Boolean;
        DeleteExportEnabled: Boolean;
        MustSpecifyDescriptionErr: Label 'You must add a description to the item before you can import a picture.';
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';

    procedure SetHideActions()
    begin
        HideActions := true;
    end;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := Rec.Picture.Count <> 0;
    end;
    
}