table 50114 "Room Booking Item Lines"
{
    Caption = 'Room Booking Item Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No"; Code[50])
        {
            Caption = 'Item No';
        }
        field(2; "Booking No"; Code[50])
        {
            Caption = 'Booking No';
            TableRelation = "Room Booking"."Booking No.";
        }
        field(3; Item; Text[50])
        {
            Caption = 'Item';
        }
        field(4; "Item Type"; Option)
        {
            OptionMembers = " ","Sanitary","Personal","General";
            Caption = 'Item Type';
        }
        field(5; "No of Items"; Code[30])
        {
            Caption = 'No of Items';
        }
    }
    keys
    {
        key(PK; "Item No", "Booking No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Item No" = '' then begin
            HRSetup.Get;
            HRSetup.TestField("Item No");
            NoSeriesMgt.InitSeries(HRSetup."Item No", xRec."No of Items", 0D, "Item No", "No of Items");
        end;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}



