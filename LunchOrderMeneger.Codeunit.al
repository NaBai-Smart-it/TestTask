codeunit 50400 LunchOrderMeneger
{
    [EventSubscriber(ObjectType::Page, Page::LunchOrder, 'OnClosePageEvent', '', true, true)]
    procedure ShowConfirmDialog(var Rec: Record LunchMenu)
    var
        UserResponse: Boolean;
        ConfirmationOrderText: Label 'Confirm Order?';
        LunchOrderEntery: Record LunchOrderEntry;
    begin
        UserResponse := Confirm(ConfirmationOrderText, false);
        if UserResponse then begin
            if Rec.FindSet() then
                repeat
                    Rec.CalcFields(Rec."Prewies Quantity"); // = Rec.SetAutoCalcFields()
                    if (Rec."Order Quantity" <> Rec."Prewies Quantity") then begin
                        LunchOrderEntery.SetRange(LunchOrderEntery."Order Date", Rec."Menu Date");
                        if not LunchOrderEntery.FindFirst() then begin
                            LunchOrderEntery.Init();;
                            LunchOrderEntery.Insert();
                        end else
                            LunchOrderEntery.Modify();

                    end;
                until Rec.Next() = 0;
        end;
    end;



    // Message('Here');
    // if (Rec."Item No." = '') and (Rec."Line Type" = Rec."Line Type"::Item) then
    // begin
    //     LunchItem.Init();
    //     LunchItem.Description := Rec.Description;
    //     LunchItem.Weight := Rec.Weight;
    //     LunchItem.Price := Rec.Price;
    //     LunchItem."Vendor No." := Rec."Vendor No.";
    //     LunchItem."Self-Order" := true;
    //     LunchItem.Insert(true);
    // end;


}