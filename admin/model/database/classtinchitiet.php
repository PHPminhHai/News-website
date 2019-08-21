<?php 
	/**
	 * summary
	 */
	class Tinchitiet
	{
       private $idTinChiTiet;
       private $idTheLoai;
       private $idLoaiTin;
       private $tieuDe;
       private $tieuDeKhongDau;
       private $tomTat;
       private $noiDung;
       private $image;
       private $ngayDang;
       private $tinNoiBat;
       private $soLanXem;
       private $anHien;
       public function __construct($idTinChiTiet,$idTheLoai,$idLoaiTin,$tieuDe,$tieuDeKhongDau,$tomTat,$noiDung,$image,$ngayDang,$tinNoiBat,$soLanXem,$anHien)
       {
          $this->idTinChiTiet = $idTinChiTiet;
          $this->idTheLoai = $idTheLoai;
          $this->idLoaiTin = $idLoaiTin;
          $this->tieuDe = $tieuDe;
          $this->tieuDeKhongDau = $tieuDeKhongDau;
          $this->tomTat = $tomTat;
          $this->noiDung = $noiDung;
          $this->image = $image;
          $this->ngayDang = $ngayDang;
          $this->tinNoiBat = $tinNoiBat;
          $this->soLanXem = $soLanXem;
          $this->anHien = $anHien;
      }
      
    /**
     * @return mixed
     */
    public function getIdTinChiTiet()
    {
    	return $this->idTinChiTiet;
    }

    /**
     * @param mixed $idTinChiTiet
     *
     * @return self
     */
    public function setIdTinChiTiet($idTinChiTiet)
    {
    	$this->idTinChiTiet = $idTinChiTiet;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getIdTheLoai()
    {
    	return $this->idTheLoai;
    }

    /**
     * @param mixed $idTheLoai
     *
     * @return self
     */
    public function setIdTheLoai($idTheLoai)
    {
    	$this->idTheLoai = $idTheLoai;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getIdLoaiTin()
    {
    	return $this->idLoaiTin;
    }

    /**
     * @param mixed $idLoaiTin
     *
     * @return self
     */
    public function setIdLoaiTin($idLoaiTin)
    {
    	$this->idLoaiTin = $idLoaiTin;

    	return $this;
    }
  
    /**
     * @return mixed
     */
    public function getTieuDe()
    {
    	return $this->tieuDe;
    }

    /**
     * @param mixed $tieuDe
     *
     * @return self
     */
    public function setTieuDe($tieuDe)
    {
    	$this->tieuDe = $tieuDe;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getTieuDeKhongDau()
    {
    	return $this->tieuDeKhongDau;
    }

    /**
     * @param mixed $tieuDeKhongDau
     *
     * @return self
     */
    public function setTieuDeKhongDau($tieuDeKhongDau)
    {
    	$this->tieuDeKhongDau = $tieuDeKhongDau;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getTomTat()
    {
    	return $this->tomTat;
    }

    /**
     * @param mixed $tomTat
     *
     * @return self
     */
    public function setTomTat($tomTat)
    {
    	$this->tomTat = $tomTat;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getNoiDung()
    {
    	return $this->noiDung;
    }

    /**
     * @param mixed $noiDung
     *
     * @return self
     */
    public function setNoiDung($noiDung)
    {
    	$this->noiDung = $noiDung;

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
    public function getNgayDang()
    {
    	return $this->ngayDang;
    }

    /**
     * @param mixed $ngayDang
     *
     * @return self
     */
    public function setNgayDang($ngayDang)
    {
    	$this->ngayDang = $ngayDang;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getTinNoiBat()
    {
    	return $this->tinNoiBat;
    }

    /**
     * @param mixed $tinNoiBat
     *
     * @return self
     */
    public function setTinNoiBat($tinNoiBat)
    {
    	$this->tinNoiBat = $tinNoiBat;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getSoLanXem()
    {
    	return $this->soLanXem;
    }

    /**
     * @param mixed $soLanXem
     *
     * @return self
     */
    public function setSoLanXem($soLanXem)
    {
    	$this->soLanXem = $soLanXem;

    	return $this;
    }

    /**
     * @return mixed
     */
    public function getAnHien()
    {
    	return $this->anHien;
    }

    /**
     * @param mixed $anHien
     *
     * @return self
     */
    public function setAnHien($anHien)
    {
    	$this->anHien = $anHien;

    	return $this;
    }
}
?>