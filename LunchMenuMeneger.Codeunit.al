codeunit 50401 LunchMenuTableMenger
{
    [EventSubscriber(ObjectType::Table, DataBase::LunchMenu, 'OnAfterValidateEvent', 'Item No.', true, true)]
    procedure OnAfterValidateItemNo(var Rec: Record LunchMenu; var xRec: Record LunchMenu; CurrFieldNo: Integer)
    var
        LunchItem: Record LunchItem;
        NoSuchItemText: Label 'No such Item in a datbase, pleas try again.';
    begin
        if (Rec."Item No." <> '') then begin
            if LunchItem.Get(Rec."Item No.") then begin
                Rec.Description := LunchItem.Description;
                Rec.Weight := LunchItem.Weight;
                Rec.Price := LunchItem.Price;
            end else begin
                Message(NoSuchItemText);
                Rec."Item No." := '';
            end;
        end

    end;

    [EventSubscriber(ObjectType::Table, DataBase::LunchMenu, 'OnAfterValidateEvent', 'Line Type', true, true)]
    procedure OnAfterValidateLineType(var Rec: Record LunchMenu; var xRec: Record LunchMenu; CurrFieldNo: Integer)
    var
        LunchItem: Record LunchItem;
    begin
        if (Rec."Line Type" = Rec."Line Type"::"Group Heading") then begin
            Rec."Item No." := '';
            Rec.Weight := 0;
            Rec.Price := 0;
            Rec.Active := false;
        end else begin
            Rec.Identation := 3;
            Rec.Active := true;
        end;
    end;
}