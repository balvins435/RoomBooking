table 50109 "Room Booking"
{
    Caption = 'Room Booking';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking No."; Code[90])
        {
            Caption = 'Booking No.';
        }
        field(2; "Customer Name"; Text[150])
        {
            Caption = 'Customer Name';
        }
        field(3; "Customer Email"; Text[100])
        {
            Caption = 'Customer Email';
        }
        field(4; "Customer Address"; Text[100])
        {
            Caption = 'Customer Address';
        }
        field(5; "Customer Phone No"; Text[100])
        {
            Caption = 'Customer Phone No';
        }
        field(6; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
        }
        field(7; "Paid"; Option)
        {
            Caption = 'Paid';
            OptionMembers = Paid,Unpaid;
        }
        field(8; "KRA No"; Code[40])
        {
            DataClassification = ToBeClassified;
            Caption = 'KRA No';

        }
        field(9; "Check in"; Option)
        {
            OptionMembers = Checkin;
            DataClassification = ToBeClassified;
        }
        field(10; "Check out"; Option)
        {
            OptionMembers = Checkout;
            DataClassification = ToBeClassified;
        }
        field(11; Booked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Amount Payable"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Room Booking Lines"."Total Amount Payable" where("Booking No" = field("Booking No.")));
        }
        field(13; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Invoiced; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Date Posted"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Booking No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Booking No." = '' then begin
            HRSetup.Get;
            HRSetup.TestField("Booking No.");
            NoSeriesMgt.InitSeries(HRSetup."Booking No.", xRec."No. Series", 0D, "Booking No.", "No. Series");
        end;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
