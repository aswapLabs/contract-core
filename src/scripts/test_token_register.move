script {

    // use 0x1::Token;
    // use 0x1::Event;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2;

    fun main(account: signer) {

        // Event::publish_generator(&account);
        Token1::init(&account);
        Token2::init(&account);
    }
}