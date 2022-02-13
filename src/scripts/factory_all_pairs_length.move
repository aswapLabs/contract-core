script {

    
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Factory;
    use 0x1::Debug;

    fun main() {
        let l = Factory::all_pairs_length();

        Debug::print(&l);
    }
}