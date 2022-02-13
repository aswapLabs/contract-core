script {

    
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Factory;

    fun main(account: signer) {
        Factory::init(&account);
    }
}