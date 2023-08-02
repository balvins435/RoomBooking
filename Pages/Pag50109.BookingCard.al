page 50109 "Booking Card"
{
    Caption = 'Booking Card';
    PageType = Card;
    SourceTable = "Room Booking";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Customer Email"; Rec."Customer Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field("Customer Phone No"; Rec."Customer Phone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Phone No field.';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address field.';
                }

                field("KRA No"; Rec."KRA No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of KRA No.';
                }
                field("Amount Payable"; Rec."Amount Payable")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {

                }
            }
            group("Room Booking Lines")
            {
                part("Rooms"; "Room Booking Lines")
                {
                    SubPageLink = "Booking No" = field("Booking No.");

                }

            }
            group("Room Booking Item Lines")
            {
                part("Item"; "Room Booking Items Lines List")
                {
                    SubPageLink = "Item No" = field("Booking No.");
                }
            }

        }
    }
    actions
    {
        area(processing)
        {
            action("Paid")
            {
                image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    if Not Confirm('Are you sure you want to make this payment? This Action will Invoice the Customer', false) then exit;
                    Payments.RoomBookingPayment(Rec);
                end;

            }
            action("Check in")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    ObjRoomBookingLines.Reset();
                    ObjRoomBookingLines.SetRange(ObjRoomBookingLines."Booking No", rec."Booking No.");
                    if ObjRoomBookingLines.FindFirst() then begin
                        ObjRoomBookingLines.Booked := true;
                        ObjRoomBookingLines.Modify();
                    end;
                end;
            }


        }


    }
    var
        Booked: Boolean;
        ObjRoomBookingLines: Record "Room Booking Lines";
        Payments: Codeunit Payments;


}
