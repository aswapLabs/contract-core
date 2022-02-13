script {

    use 0x1::Token;
    // use 0x1::Event;
    use 0x1::Debug;
    use 0x1::Account;
    // use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1;
    // use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2;

    fun main(account: signer) {

        // Event::publish_generator(&account);
        0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::mint(&account, 100000000000000);
        0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::mint(&account, 100000000000000);


        let balance = Account::balance<0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1>(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        Debug::print(&balance);

        let balance2 = Account::balance<0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2>(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        Debug::print(&balance2);

        let token_code = Token::token_code<0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1>();

        Debug::print(&token_code);



    }
}