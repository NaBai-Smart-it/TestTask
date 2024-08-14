codeunit 50400 "Lunch Order Menger"
{
    procedure PopulateTempLunchMenuTable(VendorNo: Code[20]; MenuDate: Date; var Record: Record "Lunch Menu" temporary)
    var
        LunchMenuEnteries: Record "Lunch Menu";
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
                Record.Insert(false);
                
            until LunchMenuEnteries.Next() = 0;
    end;

    procedure GetMaxMenuDate(): Date
    var
        MenuRecord: Record "Lunch Menu";
        MaxOrderDate: Date;
    begin
        MenuRecord.SetCurrentKey(MenuRecord."Menu Date");
        MenuRecord.Ascending(false);
        if MenuRecord.FindFirst() then
            MaxOrderDate := MenuRecord."Menu Date";

        exit(MaxOrderDate);
    end;

    procedure GetNextEntryNo() : Integer
    var
        LunchOrderEnteries : Record "Lunch Order Entry";
    begin
        if LunchOrderEnteries.FindLast() then
            exit(LunchOrderEnteries."Entry No." + 1);

        exit(1);
    end;
}