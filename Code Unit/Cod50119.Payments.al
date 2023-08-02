codeunit 50119 Payments
{
    var
        Cust: Record Customer;
        ObjRoomBooking: Record "Room Booking";
        CustExist: Boolean;
        KRANo: Code[100];
        SalesSetup: Record "Sales & Receivables Setup";
        Noseries: Codeunit "NoSeriesManagement";
        ObjCustPostG: Record "Customer Posting Group";
        GenJournalLine: Record "Gen. Journal Line";
        ObjCust: Record Customer;
        ObjSetup: Record "Room Setup Table";
        BalAccNo: Code[90];
        LineNo: Integer;
        PaymentProcess: Codeunit "Process Registration Payment";
        DocNo: Code[30];

        ExtDoc: Code[30];

        DocDate: Date;

        AccType: Enum "Gen. Journal Account Type Cus";

        AccNo: Code[50];

        BalAccType: Enum "Gen. Journal Account Type Cus";

        DocType: Enum "Gen. Journal Account Type Cus";

        Dim1: Code[50];

        Dim2: Code[50];

        Desc: Text[100];

    procedure RoomBookingPayment(RoomBookinRec: Record "Room Booking")
    begin
        KRANo := ObjRoomBooking."KRA No";
        CustExist := false;

        //Checking if Customer Exist

        Cust.Reset();
        Cust.SetCurrentKey("KRA No");
        Cust.SetRange("KRA No", KRANo);
        if Cust.FindFirst() then begin
            CustExist := true;
        end else begin
            CustExist := false;
        end;

        //Creating Customer

        if CustExist = false then begin
            RoomBookinRec.CalcFields("Amount Payable");
            Cust.Init();
            SalesSetup.Get();
            SalesSetup.TestField("Customer Nos.");
            Cust."No." := Noseries.GetNextNo(SalesSetup."Customer Nos.", 0D, true);
            Cust.Name := RoomBookinRec."Customer Name";
            Cust."E-Mail" := RoomBookinRec."Customer Email";
            Cust."Phone No." := RoomBookinRec."Customer Phone No";
            Cust.Address := RoomBookinRec."Customer Address";
            Cust."KRA No" := RoomBookinRec."KRA No";
            Cust."Amount Payable" := RoomBookinRec."Amount Payable";

            //Inserting Customer posting Group
            ObjCustPostG.Reset();
            ObjCustPostG.SetFilter(ObjCustPostG.Code, '=%1', 'ROOM BOOKING');
            if ObjCustPostG.FindFirst() then begin
                Cust."Customer Posting Group" := ObjCustPostG.Code;
            end;
            Cust.Insert();
            Commit();

            //Deleting Journal Lines
            GenJournalLine.Reset();
            GenJournalLine.SetRange("Journal Template Name", 'GENERAL');
            GenJournalLine.SetRange("Journal Batch Name", 'DEFAULT');
            if GenJournalLine.FindSet() then begin
                GenJournalLine.DeleteAll();
            end;

            ObjCust.Reset();
            Cust.SetCurrentKey("KRA No");
            Cust.SetRange("KRA No", KRANo);

            if ObjCust.FindFirst() then begin
                if ObjCustPostG.Get(RoomBookinRec."Booking No.") then begin
                    Cust."Customer Posting Group" := ObjCustPostG.Code;
                end
            end;
            ObjSetup.Reset();
            if ObjSetup.FindFirst() then begin
                BalAccNo := ObjSetup."Payable Account";
                LineNo := 1000;
                PaymentProcess.FnCreateBalancedGenJournalLinesPortal('GENERAL', 'DEFAULT', LineNo, RoomBookinRec."Date Posted", RoomBookinRec."Booking No.", RoomBookinRec."Booking No.", DocDate, AccType::Customer, ObjCust."No.", BalAccType::"G/L Account", BalAccNo,
                    RoomBookinRec."Amount Payable", DocType::Invoice, Dim1, Dim2, Desc, '', '');

            end;



            GenJournalLine.Reset();

            GenJournalLine.SetRange("Journal Template Name", 'GENERAL');

            GenJournalLine.SetRange("Journal Batch Name", 'DEFAULT');

            If GenJournalLine.FindSet() then begin

                CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJournalLine);



                RoomBookinRec.Posted := true;

                RoomBookinRec.Invoiced := true;

                RoomBookinRec."Date Posted" := Today;

                RoomBookinRec.Modify();

            end;



        end;
    end;







}
