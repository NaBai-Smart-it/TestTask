page 50412 "Nutritions Pie Chart"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Lunch Item";

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
                ToolTip = 'Specifies the value of the Calories field.';

            }
        }
    }

    trigger OnAfterGetRecord()
    var
    begin
        ComposePieChart();
    end;

    local procedure ComposePieChart()
        ChartBuffer: Record "Business Chart Buffer" temporary;
    var
    begin
        ChartBuffer.DeleteAll(true);
        ChartBuffer.Initialize();
        ChartBuffer.AddDecimalMeasure('Nutritions Value', 1, ChartBuffer."Chart Type"::Pie);
        ChartBuffer.SetXAxis('Nutritions', ChartBuffer."Data Type"::String);

        ChartBuffer.AddColumn(Rec.FieldName(Carbs));
        ChartBuffer.SetValueByIndex(0, 0, Rec.Carbs);
        ChartBuffer.AddColumn(Rec.FieldName(Protein));
        ChartBuffer.SetValueByIndex(0, 1, Rec.Protein);
        ChartBuffer.AddColumn(Rec.FieldName(Fats));
        ChartBuffer.SetValueByIndex(0, 2, Rec.Fats);
        ChartBuffer.AddColumn(Rec.FieldName(Fiber));
        ChartBuffer.SetValueByIndex(0, 3, Rec.Fiber);

        ChartBuffer.UpdateChart(CurrPage.Chart);
    end;
}
