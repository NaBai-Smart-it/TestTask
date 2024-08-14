page 50412 NutritionsPieChart
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = LunchItem;

    layout
    {
        area(content)
        {
            usercontrol(Chart; BusinessChart)
            {
                ApplicationArea = All;
                trigger AddInReady()
                begin
                end;
            }
            field(Calories; Rec.Calories)
            {
                Caption = 'Calories';
                ApplicationArea = All;
                
            }
        }
    }

    trigger OnAfterGetRecord()var
    begin
        ComposePieChart();
    end;

    local procedure ComposePieChart()
        ChartBuffer : Record "Business Chart Buffer" temporary;
    var
    begin
        ChartBuffer.DeleteAll(true);
        ChartBuffer.Initialize();
        ChartBuffer.AddDecimalMeasure('Nutritions Value', 1, ChartBuffer."Chart Type"::Pie);
        ChartBuffer.SetXAxis('Nutritions', ChartBuffer."Data Type"::String);

        ChartBuffer.AddColumn(Rec.FieldName("Carbs (g)"));
        ChartBuffer.SetValueByIndex(0, 0, Rec."Carbs (g)");
        ChartBuffer.AddColumn(Rec.FieldName("Protein (g)"));
        ChartBuffer.SetValueByIndex(0, 1, Rec."Protein (g)");
        ChartBuffer.AddColumn(Rec.FieldName("Fats (g)"));
        ChartBuffer.SetValueByIndex(0, 2, Rec."Fats (g)");
        ChartBuffer.AddColumn(Rec.FieldName("Fiber (g)"));
        ChartBuffer.SetValueByIndex(0, 3, Rec."Fiber (g)");

        ChartBuffer.UpdateChart(CurrPage.Chart);
    end;
}
