codeunit 50401 LunchMenuTableMeneger
{
    [EventSubscriber(ObjectType::Table, DataBase::LunchMenu, 'OnAfterValidateEvent', 'Item No.', true, true)]
    procedure OnAfterValidateItemNo(var Rec: Record LunchMenu; var xRec: Record LunchMenu; CurrFieldNo: Integer)
    var
        LunchItem: Record LunchItem;
    begin
        if (Rec."Item No." <> '') then
        begin
            LunchItem.Get(Rec."Item No.");
            Rec.Description := LunchItem.Description;
            Rec.Weight := LunchItem.Weight;
            Rec.Price := LunchItem.Price;
            Rec."Self-Ordered" := LunchItem."Self-Order";
            Rec."Line Type" := Rec."Line Type"::Item;
        end;
    end;
}