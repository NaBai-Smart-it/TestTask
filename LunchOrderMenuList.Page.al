page 50405 LunchOrderMenuList
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = LunchMenu;
    CardPageId = LunchMenuCard;
    AutoSplitKey = true;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                
                IndentationColumn = Rec.Identation;
                IndentationControls = Description;
                field("Line No.";Rec."Line No.")
                {

                }
                field(Description;Rec.Description)
                {
                    StyleExpr = BoldTextStyle;

                }
                field("Menu Date";Rec."Menu Date")
                {

                }
                field("Vendor No.";Rec."Vendor No.")
                {

                }
                field("Item No.";Rec."Item No.")
                {

                }
                field(Weight;Rec.Weight)
                {

                }
                field(Price;Rec.Price)
                {

                }
                field(Identation;Rec.Identation)
                {

                }
                field(Active;Rec.Active)
                {

                }
                field("Line Type";Rec."Line Type")
                {

                }
                field("Self-Orderd";Rec."Self-Orderd")
                {

                }
            }
        }
    }

    var 
        BoldTextStyle : Text;
        isEditable : Boolean;

    trigger OnAfterGetRecord()
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
        begin
            BoldTextStyle := 'Strong';
            isEditable := false;
        end
        else 
        begin
            BoldTextStyle := '';
            Rec.Identation := 3;
        end;

        IsEditable := Rec.Active;
        
    end;
}