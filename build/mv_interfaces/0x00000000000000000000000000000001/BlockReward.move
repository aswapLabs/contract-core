module 0x1::BlockReward {

    use 0x1::BlockReward;
    use 0x1::Event;
    use 0x1::STC;
    use 0x1::Token;

    struct BlockRewardEvent has drop, store {
        block_number: u64,
        block_reward: u128,
        gas_fees: u128,
        miner: address,
    }
    struct RewardInfo has store {
        number: u64,
        reward: u128,
        miner: address,
        gas_fees: Token::Token<STC::STC>,
    }
    struct RewardQueue has key {
        reward_number: u64,
        infos: vector<BlockReward::RewardInfo>,
        reward_events: Event::EventHandle<BlockReward::BlockRewardEvent>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun initialize(a0: &signer, a1: u64);
    native public fun process_block_reward(a0: &signer, a1: u64, a2: u128, a3: address, a4: vector<u8>, a5: Token::Token<STC::STC>);

}
