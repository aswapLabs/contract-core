module 0x1::Account {

    use 0x1::Account;
    use 0x1::Event;
    use 0x1::Option;
    use 0x1::Token;

    struct AcceptTokenEvent has drop, store {
        token_code: Token::TokenCode,
    }
    struct Account has key {
        authentication_key: vector<u8>,
        withdrawal_capability: Option::Option<Account::WithdrawCapability>,
        key_rotation_capability: Option::Option<Account::KeyRotationCapability>,
        withdraw_events: Event::EventHandle<Account::WithdrawEvent>,
        deposit_events: Event::EventHandle<Account::DepositEvent>,
        accept_token_events: Event::EventHandle<Account::AcceptTokenEvent>,
        sequence_number: u64,
    }
    struct AutoAcceptToken has key {
        enable: bool,
    }
    struct Balance<T0> has key {
        token: Token::Token<T0>,
    }
    struct DepositEvent has drop, store {
        amount: u128,
        token_code: Token::TokenCode,
        metadata: vector<u8>,
    }
    struct KeyRotationCapability has store {
        account_address: address,
    }
    struct SignerCapability has store {
        addr: address,
    }
    struct SignerDelegated has key {
        dummy_field: bool,
    }
    struct WithdrawCapability has store {
        account_address: address,
    }
    struct WithdrawEvent has drop, store {
        amount: u128,
        token_code: Token::TokenCode,
        metadata: vector<u8>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun accept_token<T0: store>(a0: signer);
    native public fun authentication_key(a0: address): vector<u8>;
    native public fun balance<T0: store>(a0: address): u128;
    native public fun can_auto_accept_token(a0: address): bool;
    native public fun create_account<T0: store>(a0: vector<u8>): address;
    native public fun create_account_with_address<T0: store>(a0: address);
    native public(script) fun create_account_with_initial_amount<T0: store>(a0: signer, a1: address, a2: vector<u8>, a3: u128);
    native public(script) fun create_account_with_initial_amount_v2<T0: store>(a0: signer, a1: address, a2: u128);
    native public fun create_genesis_account(a0: address): signer;
    native public fun create_signer_with_cap(a0: &Account::SignerCapability): signer;
    native public fun delegated_key_rotation_capability(a0: address): bool;
    native public fun delegated_withdraw_capability(a0: address): bool;
    native public fun deposit<T0: store>(a0: address, a1: Token::Token<T0>);
    native public fun deposit_to_self<T0: store>(a0: &signer, a1: Token::Token<T0>);
    native public fun deposit_with_metadata<T0: store>(a0: address, a1: Token::Token<T0>, a2: vector<u8>);
    native public fun destroy_key_rotation_capability(a0: Account::KeyRotationCapability);
    native public fun destroy_signer_cap(a0: Account::SignerCapability);
    native public fun do_accept_token<T0: store>(a0: &signer);
    native public fun exists_at(a0: address): bool;
    native public fun extract_key_rotation_capability(a0: &signer): Account::KeyRotationCapability;
    native public fun extract_withdraw_capability(a0: &signer): Account::WithdrawCapability;
    native public fun is_accept_token<T0: store>(a0: address): bool;
    native public fun is_accepts_token<T0: store>(a0: address): bool;
    native public fun is_signer_delegated(a0: address): bool;
    native public fun key_rotation_capability_address(a0: &Account::KeyRotationCapability): &address;
    native public fun pay_from<T0: store>(a0: &signer, a1: address, a2: u128);
    native public fun pay_from_capability<T0: store>(a0: &Account::WithdrawCapability, a1: address, a2: u128, a3: vector<u8>);
    native public fun pay_from_with_metadata<T0: store>(a0: &signer, a1: address, a2: u128, a3: vector<u8>);
    native public fun release_genesis_signer(a0: signer);
    native public fun remove_signer_capability(a0: &signer): Account::SignerCapability;
    native public fun restore_key_rotation_capability(a0: Account::KeyRotationCapability);
    native public fun restore_withdraw_capability(a0: Account::WithdrawCapability);
    native public(script) fun rotate_authentication_key(a0: signer, a1: vector<u8>);
    native public fun rotate_authentication_key_with_capability(a0: &Account::KeyRotationCapability, a1: vector<u8>);
    native public fun sequence_number(a0: address): u64;
    native public fun set_auto_accept_token(a0: &signer, a1: bool);
    native public fun signer_address(a0: &Account::SignerCapability): address;
    native public fun txn_epilogue<T0: store>(a0: &signer, a1: address, a2: u64, a3: u64, a4: u64, a5: u64);
    native public fun txn_epilogue_v2<T0: store>(a0: &signer, a1: address, a2: u64, a3: vector<u8>, a4: u64, a5: u64, a6: u64);
    native public fun txn_prologue<T0: store>(a0: &signer, a1: address, a2: u64, a3: vector<u8>, a4: u64, a5: u64);
    native public fun withdraw<T0: store>(a0: &signer, a1: u128): Token::Token<T0>;
    native public fun withdraw_capability_address(a0: &Account::WithdrawCapability): &address;
    native public fun withdraw_with_capability<T0: store>(a0: &Account::WithdrawCapability, a1: u128): Token::Token<T0>;
    native public fun withdraw_with_capability_and_metadata<T0: store>(a0: &Account::WithdrawCapability, a1: u128, a2: vector<u8>): Token::Token<T0>;
    native public fun withdraw_with_metadata<T0: store>(a0: &signer, a1: u128, a2: vector<u8>): Token::Token<T0>;

}
