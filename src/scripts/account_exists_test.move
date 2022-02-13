script {

    use 0x1::Account;
    use 0x1::Signer;

    fun main(account: signer) {
        let b = Account::exists_at(Signer::address_of(&account));

        assert(b, 100);
    }
}