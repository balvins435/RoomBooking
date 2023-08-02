table 50117 "Room Setup Table"
{
    Caption = 'Room Setup Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[100])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Booked; Boolean)
        {
            Caption = 'Booked';
            Editable = false;
            trigger OnValidate()
            begin
                if ObjRoomSetup.Get(RoomDescription) then begin
                    RoomDescription := ObjRoomSetup.RoomDescription;

                end;

            end;
        }
        field(4; RoomDescription; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Payable Account"; Code[90])
        {
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    var
        ObjRoomSetup: Record "Room Setup Table";
}
