package com.example.ticketbookingsystem;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
    public String encrypt(String password) throws NoSuchAlgorithmException {
        MessageDigest alg = MessageDigest.getInstance("MD5");
        alg.reset();
        alg.update(password.getBytes());
        byte[] msgDigest = alg.digest();
        BigInteger number = new BigInteger(1,msgDigest);
        String str = number.toString(16);
        return str;
    }
}
