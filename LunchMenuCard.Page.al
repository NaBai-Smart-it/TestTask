page 50403 LunchMenuCard
{
    Caption = 'Lunch Menu Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = LunchMenu;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Line No.";Rec."Line No.")
                {
                    
                }
                field("Menu Date";Rec."Menu Date")
                {
                   
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                    LookupPageId = "Vendor List";
                    
                }
                field("Item No.";Rec."Item No.")
                {
                    
                }
                field(Description;Rec.Description)
                {
                    
                    trigger OnValidate()
                    var 
                        LunchItem: Record LunchItem;
                    begin
                        if not (Rec."Item No." = '') then
                        begin
                            LunchItem.Reset();
                            LunchItem.Get(Rec."Item No.");
                            Rec.Description := LunchItem."Description";
                        end;
                    end;
                }
                field(Weight;Rec.Weight)
                {
                    
                }
                field(Price;Rec.Price)
                {
                    
                }
                field("Line Type";Rec."Line Type")
                {
                    
                }
                field(Active;Rec.Active)
                {
                    
                }
            }
        }
    }
}