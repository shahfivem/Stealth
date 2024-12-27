import React, { MouseEventHandler } from "react";
import classNames from "classnames";
import { Link } from "react-router-dom";

interface ButtonProps {
  label?: string;
  type?: "outlined" | "filled";
  color?: "purple" | "green";
  icon?: React.ReactElement | string;
  href?: string;
  disabled?: boolean;
  onClick?: () => MouseEventHandler | void;
  children?: string;
}

const Button: React.FC<ButtonProps> = ({
  color,
  label,
  icon,
  href,
  disabled,
  onClick,
  children,
}) => {
  const props = {
    title: label || children?.toString(),
    className: classNames(
      `
                rounded-lg
                px-4 py-2
                text-xl
                font-medium
                transition-colors
                duration-100
                ease-in-out
                disabled:opacity-50
            `,
      color === "purple"
        ? "bg-vivid-violet-600/25 text-vivid-violet-600 enabled:hover:bg-vivid-violet-600/50"
        : color === "green"
        ? "bg-turquoise-400/25 text-turquoise-400 enabled:hover:bg-turquoise-400/50"
        : ""
    ),
    "aria-label": label || children?.toString(),
    disabled: disabled,
    onClick: onClick,
  };

  const childrenElements = (
    <>
      {icon && icon}
      {children && children}
    </>
  );

  if (!href) {
    return <button {...props}>{childrenElements}</button>;
  } else {
    return (
      <Link to={href} {...props}>
        {childrenElements}
      </Link>
    );
  }
};

export default Button;
