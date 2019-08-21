<?php 
class QuangCao{
	private $idQuangCao;
	private $idUser;
	private $image;
	private $groupImage;
	public function __construct($idQuangCao,$idUser,$image,$groupImage){
		$this->idQuangCao =$idQuangCao;
		$this->idUser =$idUser;
		$this->image =$image;
		$this->groupImage =$groupImage;
	}


 
    /**
     * @return mixed
     */
    public function getIdQuangCao()
    {
        return $this->idQuangCao;
    }

    /**
     * @param mixed $idQuangCao
     *
     * @return self
     */
    public function setIdQuangCao($idQuangCao)
    {
        $this->idQuangCao = $idQuangCao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdUser()
    {
        return $this->idUser;
    }

    /**
     * @param mixed $idUser
     *
     * @return self
     */
    public function setIdUser($idUser)
    {
        $this->idUser = $idUser;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param mixed $image
     *
     * @return self
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getGroupImage()
    {
        return $this->groupImage;
    }

    /**
     * @param mixed $groupImage
     *
     * @return self
     */
    public function setGroupImage($groupImage)
    {
        $this->groupImage = $groupImage;

        return $this;
    }
}
?>
