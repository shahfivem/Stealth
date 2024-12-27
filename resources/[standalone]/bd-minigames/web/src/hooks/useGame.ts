import { useCallback, useEffect, useState } from "react";

const useGame = (
  duration: number,
  statusUpdateHandler: (status: number) => void
): [number, (status: number) => void] => {
  // Game status: 0=Stopped,1=Running,2=Failed,3=Win,4=Reset
  const [gameStatus, setGameStatus] = useState(0);

  const handleStatusUpdate = useCallback(
    (status: number) => {
      console.log("Handling update", status);

      setGameStatus(status);
      statusUpdateHandler(status);
    },
    [statusUpdateHandler]
  );

  useEffect(() => {
    if (gameStatus === 0) {
      handleStatusUpdate(1);
    }
  }, [gameStatus, handleStatusUpdate]);

  return [gameStatus, handleStatusUpdate];
};

export default useGame;
