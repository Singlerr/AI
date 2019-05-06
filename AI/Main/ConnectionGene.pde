class ConnectionGene{
  private float weight;
  private Node from;
  private Node to;
  private boolean enabled;
  private int innovationNo;
  public ConnectionGene(Node from,Node to,float weight,int innovationNo){
    this.from = from;
    this.to  = to;
    this.weight = weight;
    this.innovationNo = innovationNo;
    this.enabled = true;
  }
   public ConnectionGene(Node from,Node to,float weight,int innovationNo,boolean enabled){
    this.from = from;
    this.to  = to;
    this.weight = weight;
    this.innovationNo = innovationNo;
    this.enabled = enabled;
  }
  public ConnectionGene mutateWeight(){
    float r = random(1);
    if(r < 0.1){
      this.weight = random(-1,1);
    }else{
      this.weight += randomGaussian()/50;
    if(weight > 1){
      weight = 1;
    }else{
      weight = -1;
    }
  }
    return this;
  }
  public ConnectionGene clone(Node from,Node to){
    return new ConnectionGene(from,to,weight,innovationNo,enabled);
  }
}
