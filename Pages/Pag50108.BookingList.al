page 50108 BookingList
{
    ApplicationArea = All;
    Caption = 'BookingList';
    PageType = List;
    CardPageId = "Booking Card";
    SourceTable = "Room Booking";
    UsageCategory = Lists;
    

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Booking No."; Rec."Booking No.")
                {
                    editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }

            }
        }
    }
}
