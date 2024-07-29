codeunit 50400 LunchOrderMeneger
{
    procedure PopulateTempLunchMenuTable(VendorNo: Code[20]; MenuDate: Date; var Record: Record LunchMenu temporary)
    var
        LunchMenuEnteries: Record LunchMenu;
    begin
        if not Record.IsEmpty() then
        begin
            Record.DeleteAll(false);
        end;
        
        LunchMenuEnteries.Reset();
        LunchMenuEnteries.SetRange(LunchMenuEnteries."Menu Date", MenuDate);
        LunchMenuEnteries.SetRange(LunchMenuEnteries."Vendor No.", VendorNo);

        if LunchMenuEnteries.FindSet() then
            repeat
                Record.Init();
                Record."Line No." := LunchMenuEnteries."Line No.";
                Record.Description := LunchMenuEnteries.Description;
                Record."Menu Date" := LunchMenuEnteries."Menu Date";
                Record."Vendor No." := LunchMenuEnteries."Vendor No.";
                Record."Line Type" := LunchMenuEnteries."Line Type";
                Record.Weight := LunchMenuEnteries.Weight;
                Record.Price := LunchMenuEnteries.Price;
                Record."Item No." := LunchMenuEnteries."Item No.";
                Record.Active := LunchMenuEnteries.Active;
                Record."Menu Item Entry No." := LunchMenuEnteries."Menu Item Entry No.";
                Record.Identation := LunchMenuEnteries.Identation;
                if Record.Insert(false) then
                    Message('Inserted');
                
            until LunchMenuEnteries.Next() = 0;

            if Record.FindSet() then
            repeat
            until Record.Next() = 0;

    end;

    procedure GetMaxMenuDate(): Date
    var
        MenuRecoed: Record LunchMenu;
        MaxOrderDate: Date;
    begin

        if MenuRecoed.FindSet() then
        begin
            repeat
                if MenuRecoed."Menu Date" > MaxOrderDate then
                begin
                    MaxOrderDate := MenuRecoed."Menu Date";
                end;
            until MenuRecoed.Next() = 0;
        end;

        exit(MaxOrderDate);
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

    //[EventSubscriber(ObjectType::Page, Page::LunchOrder, 'OnClosePageEvent', '', true, true)]
    // procedure ShowConfirmDialog(var Rec: Record LunchMenu)
    // var
    //     UserResponse: Boolean;
    //     ConfirmationOrderText: Label 'Confirm Order?';
    //     LunchOrderEntery: Record LunchOrderEntry;
    //     iter: Integer;
    // begin
    //     iter := 1;
    //     UserResponse := Confirm(ConfirmationOrderText, false);
    //     Rec.SetAutoCalcFields(Rec."Prewies Quantity");
    //     if UserResponse then begin
    //         if Rec.FindSet() then
    //             repeat
                
    //                 Message('quantity -> %1 :::::: %2 <- Prew quantity', Rec."Order Quantity", Rec."Prewies Quantity");
    //                 if (Rec."Order Quantity" <> Rec."Prewies Quantity") then begin
    //                     LunchOrderEntery.Reset();
    //                     Message('Desc _> %1', Rec.Description);
    //                     LunchOrderEntery.SetRange(LunchOrderEntery."Order Date", Rec."Menu Date");
    //                     Message('%1 ++Date+++ %2', LunchOrderEntery."Order Date", Rec."Menu Date");
    //                     LunchOrderEntery.SetRange(LunchOrderEntery."Vendor No.", Rec."Vendor No.");
    //                     Message('%1 ++Vendor+++ %2', LunchOrderEntery."Vendor No.", Rec."Vendor No.");
    //                     LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item No.", Rec."Item No.");
    //                     Message('%1 ++Item+++ %2', LunchOrderEntery."Menu Item No.", Rec."Item No.");
    //                     LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item Entry No.", Rec."Menu Item Entry No.");
    //                     Message('%1 ++Entery+++ %2', LunchOrderEntery."Menu Item Entry No.", Rec."Menu Item Entry No.");
    //                     LunchOrderEntery.SetRange(LunchOrderEntery."Resourse No.", UserId());
    //                     Message('%1 ++User+++ %2', LunchOrderEntery."Resourse No.", UserId());

    //                     iter := iter + 1;

    //                     Message('Number of Enteries -> %1', LunchOrderEntery.Count());

    //                     if not LunchOrderEntery.FindFirst() then 
    //                     begin
    //                         Message('Inserting record %1', Rec.Description);
    //                         LunchOrderEntery.Init();
    //                         LunchOrderEntery.Validate("Entry No.", (LunchOrderEntery."Entry No." + 1));
    //                         LunchOrderEntery.Validate("Item Description", Rec.Description);
    //                         LunchOrderEntery.Validate("Menu Item Entry No.", Rec."Menu Item Entry No.");
    //                         LunchOrderEntery.Validate("Menu Item No.", Rec."Item No.");
    //                         LunchOrderEntery.Validate("Order Date", Rec."Menu Date");
    //                         LunchOrderEntery.Validate(Price, Rec."Order Amount");
    //                         LunchOrderEntery.Validate(Quantity, Rec."Order Quantity");
    //                         LunchOrderEntery.Validate("Resourse No.", UserId());
    //                         LunchOrderEntery.Validate("Vendor No.", Rec."Vendor No.");
    //                         LunchOrderEntery.Validate(Status, LunchOrderEntery.Status::Created);
    //                         if(LunchOrderEntery.Insert(false)) then
    //                             Message('Record %1 inserted', Rec.Description)
    //                         else
    //                             Message('Record %1 was NOT inserted', Rec.Description);
    //                     end 
    //                     else
    //                     begin
                            
    //                         Message('Modyfiing record %1', Rec.Description);
    //                         LunchOrderEntery."Item Description" := Rec.Description;
    //                         LunchOrderEntery."Menu Item Entry No." := Rec."Menu Item Entry No.";
    //                         LunchOrderEntery."Menu Item No." := Rec."Item No.";
    //                         LunchOrderEntery."Order Date" := Rec."Menu Date";
    //                         LunchOrderEntery.Price := Rec."Order Amount";
    //                         LunchOrderEntery.Quantity := Rec."Order Quantity";
    //                         LunchOrderEntery."Resourse No." := UserId();
    //                         LunchOrderEntery.Validate("Vendor No.", Rec."Vendor No.");
    //                         if(LunchOrderEntery.Modify(true)) then
    //                             Message('Record %1 Modified', Rec.Description);
    //                     end;
                        
    //                     Message('No of iterations -> %1', iter);

    //                 end;
    //             until Rec.Next() = 0;
    //     end;
    // end;
}