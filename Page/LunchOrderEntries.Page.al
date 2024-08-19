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
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Menu Item Entry No."; Rec."Menu Item Entry No.")
                {
                    ToolTip = 'Specifies the value of the Menu Item Entry No. field.';
                }
                field("Menu Item No."; Rec."Menu Item No.")
                {
                    ToolTip = 'Specifies the value of the Menu Item No. field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Resourse No."; Rec."Resourse No.")
                {
                    ToolTip = 'Specifies the value of the Resourse No. field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Lunch Order Entry Status field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
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
                ToolTip = 'Executes the Send To Vendor action.';

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