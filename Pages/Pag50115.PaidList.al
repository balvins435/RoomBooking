page 50115 "Paid List"
{
    ApplicationArea = All;
    Caption = 'Paid List';
    PageType = List;
    SourceTable = "Room Booking";
    UsageCategory = Lists;
    SourceTableView = where("Paid" = filter(Paid));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Booking No."; Rec."Booking No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Customer Phone No"; Rec."Customer Phone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Phone No field.';
                }

                field(Paid; Rec.Paid)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paid field.';
                }
            }
        }
    }
}
