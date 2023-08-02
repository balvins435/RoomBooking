codeunit 50120 "Process Registration Payment"
{
    var
        GenJnlLine: Record "Gen. Journal Line";
        //Reg: Record "Registration Management";
        ObjCust: Record Customer;
        SMTP: Codeunit Mail;
        //SMTPMailMessage: Codeunit "Email Message";
        //SMTPMail: Codeunit Email;
        //SMTPSetup: Record "SMTP Mail Setup2";
        MailSenderName: Text;
        MailSenderAddress: Text;
        MailRecipient: Text;
        MailRecipients: Text[500];
        MailRecipients2: Text[500];
        MailSubject: Text;
        TxtFileName: Text[250];
        MailContent: Text;
        MailContent2: Text;
        MailSalutation: Text;
        MailSalutation2: Text;
        FileName: Text;
        SMSRecipients: List of [Text];
        TbCompanyInfo: Record "Company Information";
       // TbCommunication: Record "Documents Notification";
        //TbRegistration: Record "Registration Management";

    [EventSubscriber(ObjectType::Table, database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure PostingsFromPortal(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        ObjCust: Record Customer;
    begin
        //CustLedgerEntry.Portal := GenJournalLine.Portal;
        if ObjCust.get(CustLedgerEntry."Customer No.") then
            CustLedgerEntry."Customer Name" := ObjCust.Name;
    end;

    procedure FnCreateBalancedGenJournalLinesPortal(JTemplate: Code[50]; JBatch: Code[50]; LineNo: Integer; Pdate: Date; DocNo: Code[50]; ExtDocNo: Code[50]; DocDate: Date; AccType: Enum "Gen. Journal Account Type Cus"; AccNo: Code[50]; BalAccType: Enum "Gen. Journal Account Type Cus"; BalAccNo: Code[50]; Amount: Decimal; DocType: Enum "Gen. Journal Account Type Cus"; Dim1: Code[50]; Dim2: Code[50]; Desc: Text; souceCode: Code[100]; currency: Code[20])
    var
        TbExchangeRate: record "Currency Exchange Rate";
        TbCurrency: record Currency;
    begin

        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Posting Date" := Pdate;
        GenJnlLine."Document No." := DocNo;
        GenJnlLine."Document Type" := DocType;
        GenJnlLine."External Document No." := ExtDocNo;
        GenJnlLine."Document Date" := DocDate;
        GenJnlLine."Account Type" := AccType;
        GenJnlLine."Account No." := AccNo;
        //GenJnlLine.Portal := true;
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
        GenJnlLine."Bal. Account Type" := BalAccType;
        GenJnlLine."Bal. Account No." := BalAccNo;
        GenJnlLine."Currency Code" := currency;
        TbCurrency.Reset();
        TbCurrency.SetRange(TbCurrency.Code, currency);
        //If TbCurrency.FindFirst() then begin
        //     if TbCurrency.LCY then
        //         GenJnlLine."Currency Factor" := 1
        //     else
        //         GenJnlLine."Currency Factor" := TbExchangeRate.GetCurrentCurrencyFactor(TbCurrency.Code);
        // end;
        GenJnlLine.Amount := Amount;
        GenJnlLine."Source Code" := souceCode;
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Document Type" := DocType;
        GenJnlLine."Shortcut Dimension 1 Code" := Dim1;
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Dim2;
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.Description := Desc;
        GenJnlLine.VALIDATE(GenJnlLine.Description);
        IF GenJnlLine.Amount <> 0 THEN
            GenJnlLine.INSERT;
    end;

    procedure FnCreateBalancedGenJournalLines(JTemplate: Code[50]; JBatch: Code[50]; LineNo: Integer; Pdate: Date; DocNo: Code[50]; ExtDocNo: Code[50]; DocDate: Date; AccType: Enum "Gen. Journal Account Type Cus"; AccNo: Code[50]; BalAccType: Enum "Gen. Journal Account Type Cus"; BalAccNo: Code[50]; Amount: Decimal; DocType: Enum "Gen. Journal Document Type Cus"; Dim1: Code[50]; Dim2: Code[50]; Desc: Text; souceCode: Code[100]; currency: Code[20])
    var
        TbExchangeRate: record "Currency Exchange Rate";
        TbCurrency: record Currency;

    begin

        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Posting Date" := Pdate;
        GenJnlLine."Document No." := DocNo;
        GenJnlLine."Document Type" := DocType;
        GenJnlLine."External Document No." := ExtDocNo;
        GenJnlLine."Document Date" := DocDate;
        GenJnlLine."Account Type" := AccType;
        GenJnlLine."Account No." := AccNo;
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
        GenJnlLine."Bal. Account Type" := BalAccType;
        GenJnlLine."Bal. Account No." := BalAccNo;
        GenJnlLine."Currency Code" := currency;
        TbCurrency.Reset();
        TbCurrency.SetRange(TbCurrency.Code, currency);
        // If TbCurrency.FindFirst() then begin
        //     if TbCurrency.LCY then
        //         GenJnlLine."Currency Factor" := 1
        //     else
        //         GenJnlLine."Currency Factor" := TbExchangeRate.GetCurrentCurrencyFactor(TbCurrency.Code);
        // end;
        GenJnlLine.Amount := Amount;
        GenJnlLine."Source Code" := souceCode;
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Document Type" := DocType;
        GenJnlLine."Shortcut Dimension 1 Code" := Dim1;
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Dim2;
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.Description := Desc;
        GenJnlLine.VALIDATE(GenJnlLine.Description);
        IF GenJnlLine.Amount <> 0 THEN
            GenJnlLine.INSERT;
    end;

    procedure FnInsertLedgerEntry(Cust: Record Customer; DocNo: Code[50]; DocType: Enum "Gen. Journal Document Type Cus"; productName: Text[200]; Amount: Decimal; RctBank: Code[50]; ObjRoomBooking: Record "Room Booking")
    var
        CustLed: Record "Cust. Ledger Entry";
        Ln: Integer;
    begin
        CustLed.RESET;
        IF CustLed.FIND('+') THEN
            Ln := CustLed."Entry No.";

        CustLed.INIT;
        CustLed."Entry No." := Ln + 1;
        CustLed."Document No." := DocNo;
        CustLed."Customer No." := Cust."No.";
        CustLed.Amount := Amount * -1;
        CustLed."Document Type" := DocType;
        CustLed.Description := ObjRoomBooking. "Customer Name";
        //CustLed."Document Type" := TransactionType;
        // CustLed.Description := Desc;
        // CustLed.Posted := TRUE;
        CustLed."Posting Date" := TODAY;
        //CustLed.Period := DATE2DMY(TODAY, 3);
        CustLed."Bal. Account No." := RctBank;
        CustLed."Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
        CustLed."Global Dimension 2 Code" := Cust."Global Dimension 2 Code";
        CustLed.INSERT;
    end;
//     procedure SendNotification(var RecDocNotification: record "Documents Notification") returnValue: Boolean
//     var
//         files: List of [Text];
//         counter: Integer;
//         myPhoneNo: Text;

//     begin
//         if Confirm('Send communication?') = false then exit;
//         RecDocNotification.TestField("Communicate To");
//         Message('to%1');
//         RecDocNotification.TestField(Subject);
//         Message('Subject1');
//         RecDocNotification.TestField("Email Message Content");
//         Message('mailMessageContent%1');
//         // RecDocNotification.TestField("Time Limited Status");
//         ObjCust.Reset();
//         if ObjCust.Get(RecDocNotification."Interaction No.") then begin
//             Message('%1 Int No', RecDocNotification."Interaction No.");
//             if RecDocNotification."Communicate To" = RecDocNotification."Communicate To"::LTR then begin
//                 ObjCust.Reset();
//                 ObjCust.SetRange("No.", RecDocNotification."Interaction No.");
//                 Message('%1No', ObjCust."No.");
//                 if ObjCust.FindSet() then begin
//                     MailContent := 'Greetings,';
//                     repeat
//                         ObjCust.TestField("E-Mail");
//                         Message('%1Email', ObjCust."E-Mail");
//                         MailRecipients := MailRecipients + ';' + ObjCust."E-Mail";
//                         Message('%1MailRecipients', MailRecipients);
//                         if (RecDocNotification."SMS Message Content" <> '') then begin
//                             ObjCust.TestField("Phone No.");
//                             SMSRecipients.Add(ObjCust."Phone No.");
//                         end;
//                     until ObjCust.Next() = 0;
//                 end;
//             end;
//             TbCompanyInfo.get();
//             TbCompanyInfo.TestField("E-Mail");
//             MailSenderAddress := TbCompanyInfo."E-Mail";
//             MailSenderName := CompanyName;


//             //  ** SEND EMAIL

//             MailContent := MailContent + ' ' + RecDocNotification."Email Message Content" + ' ' + TbRegistration."Product No.";

//             MailSubject := RecDocNotification.Subject;

//             SMTP.CreateMessage(MailSenderName, MailSenderAddress, MailRecipient, MailSubject, '', false, false);

//             if RecDocNotification."CC To" <> '' then
//                 SMTP.AddBodyline(MailContent);

//             SMTP.Send;
//             //delete files
//             foreach TxtfileName in files do
//                 Erase(TxtfileName);
//             //update status
//             TbCommunication.Get(RecDocNotification.Code);
//             TbCommunication.Sent := true;
//             TbCommunication."Date & Time Sent" := CreateDateTime(Today, Time);
//             TbCommunication."Sent By" := UserId;
//             TbCommunication.Modify();

//             TbRegistration.Modify();
//             Message('Communication Sent successfully via email with ' + format(files.Count) + ' attachments.');
//         end;
//     end;


}