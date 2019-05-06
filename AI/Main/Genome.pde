class Genome{
    private int inputs,outputs;
    private ArrayList<ConnectionGene> genes;
    private ArrayList<Node> nodes;
    private int layers;
    private int nextNode;
    private int biasNode;
    private ArrayList<Node> network;
    public Genome(int inputs,int outputs,boolean crossOver){
        this.genes = new ArrayList<>();
        this.nodes = new ArrayList<>();
        this.network = new ArrayList<>();
        this.layers = 2;
        this.nextNode = 0;
        if(crossOver){
            return;
        }
        for(int i = 0;i< this.inputs;i++){
            this.nodes.add(new Node(i));
            this.nextNode++;
            this.nodes.get(i).setLayer(0);
        }
        for(int i = 0;i< this.outputs;i++){
            this.nodes.add(new Node(i+ this.inputs));
            this.nodes.get(i + this.inputs).setLayer(1);
            this.nextNode++;
        }
        this.nodes.add(new Node(this.nextNode));
        this.biasNode = this.nextNode;
        this.nextNode++;
        this.nodes.get(this.biasNode).setLayer(0);
    }
    public Genome connectFully(InnovationHistory ih){
        for(int i = 0;i < this.inputs;i++){
            for(int j = 0;j < this.outputs)
        }
    }
}
