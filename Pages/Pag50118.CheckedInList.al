page 50118 "Checked In List"
{
    Caption = 'Checked In List';
    PageType = List;
    SourceTable = "Room Booking";
    SourceTableView = where("Check in"=filter(Checkin));

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
                field("Check in"; Rec."Check in")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check in field.';
                }
            }
        }
    }
}
