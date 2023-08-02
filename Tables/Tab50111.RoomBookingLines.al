table 50111 "Room Booking Lines"
{
    Caption = 'Room Booking Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking Line"; Code[90])
        {
            Caption = 'Booking Line';
            Editable = false;
        }
        field(2; "Booking No"; Code[90])
        {
            Caption = 'Booking No';
            TableRelation = "Room Booking"."Booking No.";
            Editable = false;
        }
        field(3; "Line no"; Integer)
        {
            Caption = 'Line no';
        }
        field(4; "Amount Payable"; Decimal)
        {
            Caption = 'Amount Payable';
        }
        field(5; Room; Code[90])
        {
            Caption = 'Room';
            TableRelation = "Room Setup Table".Code;
            trigger OnValidate()
            begin
                if ObjRoom.Get(Room) then begin
                    RoomDescription := ObjRoom.RoomDescription;
                    Booked := ObjRoom.Booked;
                end;
            end;


        }
        field(6; RoomDescription; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'RoomDescription';
        }
        field(7; "No of Days"; Integer)
        {
            Caption = 'No of Days';
            Editable = true;
            trigger OnValidate()
            begin
                "Check Out Date" := CalcDate(Format("No of Days") + 'D', "Check In Date");
                "Total Amount Payable" := "No of Days" * "Amount Payable";

            end;
        }
        field(8; Package; Text[100])
        {
            Caption = 'Package';
            TableRelation = "Packages table".Code;
            trigger OnValidate()

            begin
                if ObjPackage.Get(Package) then begin
                    Description := ObjPackage.Description;
                    "Amount Payable" := ObjPackage."Amount Payable";
                end;

            end;
        }
        field(9; "Check In Date"; Date)
        {
            Caption = 'Check In Date';
        }
        field(10; "Check Out Date"; Date)
        {
            Caption = 'Check Out Date';
            Editable = false;
        }
        field(11; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
        }
        field(12; "Paid"; Option)
        {
            Caption = 'Paid';
            OptionMembers = Paid,Unpaid;
        }
        field(13; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;


        }
        field(14; Booked; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Total Amount Payable"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Booking Line", "Booking No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Booking Line" = '' then begin
            HRSetup.Get;
            HRSetup.TestField("Booking Line");
            NoSeriesMgt.InitSeries(HRSetup."Booking Line", xRec."No. Series", 0D, "Booking Line", "No. Series");
        end;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        ObjPackage: Record "Packages table";
        ObjRoom: Record "Room Setup Table";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
