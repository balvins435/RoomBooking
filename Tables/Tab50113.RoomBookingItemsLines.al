table 50113 "Room Booking Items Lines"
{
    Caption = 'Room Booking Items Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No"; Code[40])
        {
            Caption = 'Item No';
            Editable = false;
        }
        field(2; Item; Text[40])
        {
            Caption = 'Item';
            Editable = false;
            
        }
        field(3; "Item Type"; Option)
        {
            OptionMembers = "Sanitary","Personal","General";
            Caption = 'Item Type';
        }
        field(4; "No of Items"; Code[50])
        {
            Caption = 'No of Items';
        }
    }
    keys
    {
        key(PK; "Item No")
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


