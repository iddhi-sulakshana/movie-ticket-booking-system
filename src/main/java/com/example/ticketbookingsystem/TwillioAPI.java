package com.example.ticketbookingsystem;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

public class TwillioAPI {

    public static final String ACCOUNT_SID = "AC6bf7d6e8a112a5c44deb8b487d5edc31";
    public static final String AUTH_TOKEN = "fb9e0476c8f85a86af6e332caf8270ae";

    public void sendSMS(String to, String body) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                        new com.twilio.type.PhoneNumber(to),
                        new com.twilio.type.PhoneNumber("+13608187449"), body)
                .create();

        System.out.println(message.getSid());
    }



}
