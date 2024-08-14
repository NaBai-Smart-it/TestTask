page 50406 "Lunch Order Entries"
{
    Caption = 'Lunch Order Entries';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Lunch Order Entry";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(Enteries)
            {
                ShowCaption = false;
                
                field("Entry No."; Rec."Entry No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field("Menu Item Entry No."; Rec."Menu Item Entry No.")
                {
                }
                field("Menu Item No."; Rec."Menu Item No.")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field(Price; Rec.Price)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Resourse No."; Rec."Resourse No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendToVendor)
            {
                Caption = 'Send To Vendor';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SendToVendorSelected();
                end;
            }
        }
    }

    local procedure SendToVendorSelected()
    var
        SelectedLunchOrderEnteries: Record "Lunch Order Entry";
    begin
        CurrPage.SetSelectionFilter(SelectedLunchOrderEnteries);
        SelectedLunchOrderEnteries.SetRange(SelectedLunchOrderEnteries.Status, SelectedLunchOrderEnteries.Status::Created);
        if not SelectedLunchOrderEnteries.IsEmpty() then
            SelectedLunchOrderEnteries.ModifyAll(SelectedLunchOrderEnteries.Status, SelectedLunchOrderEnteries.Status::"Sent to Vendor", true);
    end;
    
}