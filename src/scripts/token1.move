script {

    // use 0x1::Token;
    // use 0x1::Event;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1;
    use 0x1::Debug;

    fun main(account: signer) {

   //     Event::publish_generator(&account);
        Token1::init_cli(&account);
        let  num = Token1::get_balance_cli(&account);
        Debug::print(&num);

    }
}