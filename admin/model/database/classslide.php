<?php 
class Slide{
	private $idSlide;
	private $idUser;
	private $image;
	private $groupImage;
	public function __construct($idSlide,$idUser,$image,$groupImage){
		$this->idSlide =$idSlide;
		$this->image =$image;
		$this->groupImage =$groupImage;
	}

    /**
     * @return mixed
     */
    public function getIdSlide()
    {
        return $this->idSlide;
    }

    /**
     * @param mixed $idSlide
     *
     * @return self
     */
    public function setIdSlide($idSlide)
    {
        $this->idSlide = $idSlide;

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
}?>

