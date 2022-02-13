module 0x1::Dao {

    use 0x1::Config;
    use 0x1::Dao;
    use 0x1::Event;
    use 0x1::Option;
    use 0x1::Token;

    struct DaoConfig<T0: copy+ drop+ store> has copy, drop, store {
        voting_delay: u64,
        voting_period: u64,
        voting_quorum_rate: u8,
        min_action_delay: u64,
    }
    struct DaoGlobalInfo<T0: store> has key {
        next_proposal_id: u64,
        proposal_create_event: Event::EventHandle<Dao::ProposalCreatedEvent>,
        vote_changed_event: Event::EventHandle<Dao::VoteChangedEvent>,
    }
    struct Proposal<T0: store, T1: store> has key {
        id: u64,
        proposer: address,
        start_time: u64,
        end_time: u64,
        for_votes: u128,
        against_votes: u128,
        eta: u64,
        action_delay: u64,
        quorum_votes: u128,
        action: Option::Option<T1>,
    }
    struct ProposalCreatedEvent has drop, store {
        proposal_id: u64,
        proposer: address,
    }
    struct Vote<T0: store> has key {
        proposer: address,
        id: u64,
        stake: Token::Token<T0>,
        agree: bool,
    }
    struct VoteChangedEvent has drop, store {
        proposal_id: u64,
        voter: address,
        proposer: address,
        agree: bool,
        vote: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun cast_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: address, a2: u64, a3: Token::Token<T0>, a4: bool);
    native public fun change_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: address, a2: u64, a3: bool);
    native public(script) fun destroy_terminated_proposal<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64);
    native public fun extract_proposal_action<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64): T1;
    native public fun has_vote<T0: copy+ drop+ store>(a0: address, a1: address, a2: u64): bool;
    native public fun min_action_delay<T0: copy+ drop+ store>(): u64;
    native public fun modify_dao_config<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<Dao::DaoConfig<T0>>, a1: u64, a2: u64, a3: u8, a4: u64);
    native public fun new_dao_config<T0: copy+ drop+ store>(a0: u64, a1: u64, a2: u8, a3: u64): Dao::DaoConfig<T0>;
    native public fun plugin<T0: copy+ drop+ store>(a0: &signer, a1: u64, a2: u64, a3: u8, a4: u64);
    native public fun proposal_exists<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64): bool;
    native public fun proposal_info<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address): (u64, u64, u64, u128, u128);
    native public fun proposal_state<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64): u8;
    native public fun propose<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: T1, a2: u64);
    native public(script) fun queue_proposal_action<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64);
    native public fun quorum_votes<T0: copy+ drop+ store>(): u128;
    native public fun revoke_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: address, a2: u64, a3: u128): Token::Token<T0>;
    native public fun set_min_action_delay<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<Dao::DaoConfig<T0>>, a1: u64);
    native public fun set_voting_delay<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<Dao::DaoConfig<T0>>, a1: u64);
    native public fun set_voting_period<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<Dao::DaoConfig<T0>>, a1: u64);
    native public fun set_voting_quorum_rate<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<Dao::DaoConfig<T0>>, a1: u8);
    native public fun unstake_votes<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: address, a2: u64): Token::Token<T0>;
    native public fun vote_of<T0: copy+ drop+ store>(a0: address, a1: address, a2: u64): (bool, u128);
    native public fun voting_delay<T0: copy+ drop+ store>(): u64;
    native public fun voting_period<T0: copy+ drop+ store>(): u64;
    native public fun voting_quorum_rate<T0: copy+ drop+ store>(): u8;

}
