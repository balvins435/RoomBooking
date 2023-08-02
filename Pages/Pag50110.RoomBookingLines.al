page 50110 "Room Booking Lines"
{
    Caption = 'Room Booking Lines';
    PageType = ListPart;
    SourceTable = "Room Booking Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Booking Line"; Rec."Booking Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking Line field.';
                }
                field("Booking No"; Rec."Booking No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking No field.';
                }
                field(Room; Rec.Room)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Room field.';
                }
                field(RoomDescription; Rec.RoomDescription)
                {

                }
                field(Booked; Rec.Booked)
                {
                    ApplicationArea = All;

                }
                field(Package; Rec.Package)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Package field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Check In Date"; Rec."Check In Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check In Date field.';
                }
                field("Check Out Date"; Rec."Check Out Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check Out Date field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("Amount Payable"; Rec."Amount Payable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Payable field.';
                    Editable = true;
                }
                field("Total Amount Payable"; Rec."Total Amount Payable")
                {
                    Editable = false;

                }
                field("Paid"; Rec."Paid")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Paid field';
                }

            }
        }
    }
}
